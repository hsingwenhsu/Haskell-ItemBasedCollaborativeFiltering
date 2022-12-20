module CFLib (
    getItemPairs,
    getSimTuples,
    getSimTuplesStatic,
    getSimTuplesPar1,
    getSimTuplesPar2,
    -- getItemSimilarityMap,
    -- getItemSimilarityMapPar,
    createItemSimilarityMap,
    setItemSimilarityMap,
    getPredictedRatingsByUser,
    getTopKRecommendationsForUserSeq,
    getTopKRecommendationsForUserPar1,
    getTopKRecommendationsForUserPar2,
    getRMSE
) where
import Control.Parallel.Strategies
import Control.DeepSeq

import qualified Data.Heap as Heap
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Data.Matrix

import CFDataStructures
import SimilarityLib

getItemPairs :: Int -> [(ItemId, ItemId)]
getItemPairs 0 = []
getItemPairs itemNum = [(i, j) | i <- [1..itemNum], j <- [(i + 1)..itemNum]]

getSimTuple :: Matrix Rating -> (ItemId, ItemId) -> (ItemId, ItemId, Similarity)
getSimTuple mc (itemId1, itemId2) = (itemId1, itemId2, getCosSimilarity mc itemId1 itemId2)

getSimTuples :: Matrix Rating -> [(ItemId, ItemId)] -> [(ItemId, ItemId, Similarity)]
getSimTuples _ [] = []
getSimTuples mc x = map f x
  where f :: (ItemId, ItemId) -> (ItemId, ItemId, Similarity)
        f (itemId1, itemId2) = (itemId1, itemId2, getCosSimilarity mc itemId1 itemId2)

-- Static partitioning
getSimTuplesStatic :: Matrix Rating -> [(ItemId, ItemId)] -> [(ItemId, ItemId, Similarity)]
getSimTuplesStatic _ [] = []
getSimTuplesStatic mc x = runEval $ do
    let (as, bs) = splitAt(length x `div` 2) x
    as' <- rpar (force (map (getSimTuple mc) as))
    bs' <- rpar (force (map (getSimTuple mc) bs))
    _ <- rseq as'
    _ <- rseq bs'
    return (as' ++ bs')

getSimTuplesPar1 :: Matrix Rating -> [(ItemId, ItemId)] -> [(ItemId, ItemId, Similarity)]
getSimTuplesPar1 _ [] = []
getSimTuplesPar1 mc x = map (getSimTuple mc) x `using` parList rseq

getSimTuplesPar2 :: Matrix Rating -> [(ItemId, ItemId)] -> Int -> [(ItemId, ItemId, Similarity)]
getSimTuplesPar2 _ [] _ = []
getSimTuplesPar2 mc x chunkSize = map(getSimTuple mc) x `using` parListChunk chunkSize rseq

-- Sequentially compute itemSimilarity Map
-- getItemSimilarityMap :: Matrix Rating -> Int -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
-- getItemSimilarityMap mc itemNum = itemSimilarityMap
--     where 
--         itemIdPairs        = getItemPairs itemNum
--         ijSimTuples        = getSimTuples mc itemIdPairs
--         itemSimilarityMap0 = createItemSimilarityMap itemNum
--         itemSimilarityMap  = setItemSimilarityMap itemSimilarityMap0 ijSimTuples

-- getItemSimilarityMapPar :: Matrix Rating -> Int -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
-- getItemSimilarityMapPar mc itemNum = itemSimilarityMap
--     where
--         itemIdPairs        = getItemPairs itemNum
--         ijSimTuples        = getSimTuplesPar mc itemIdPairs
--         itemSimilarityMap0 = createItemSimilarityMap itemNum
--         itemSimilarityMap  = setItemSimilarityMap itemSimilarityMap0 ijSimTuples


setItemSimilarityMap :: Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
    -> [(ItemId, ItemId, Similarity)]
    -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
setItemSimilarityMap sm [] = sm
setItemSimilarityMap sm ((itemId1, itemId2, sim):xs) = do
    case Map.lookup itemId1 sm of 
        Just itemSimHeap1 -> do
            let itemSimHeap1' = Heap.insert(sim, itemId2) itemSimHeap1
            let sm' = Map.insert itemId1 itemSimHeap1' sm
            case Map.lookup itemId2 sm of
                Just itemSimHeap2 -> do
                    let itemSimHeap2' = Heap.insert(sim, itemId1) itemSimHeap2
                    let sm'' = Map.insert itemId2 itemSimHeap2' sm'
                    setItemSimilarityMap sm'' xs
                Nothing -> setItemSimilarityMap sm' xs
        Nothing -> do
            case Map.lookup itemId2 sm of 
                Just itemSimHeap2 -> do
                    let itemSimHeap2' = Heap.insert (sim, itemId1) itemSimHeap2
                    let sm' = Map.insert itemId2 itemSimHeap2' sm
                    setItemSimilarityMap sm' xs
                Nothing -> setItemSimilarityMap sm xs

-- ## Helper functions for getItemSimilarityMap *** 
-- * createItemHeapList itemNum itemId_i -> [(itemId_i, Similarity heap for item i)]
createItemHeapList :: Int -> ItemId -> [(ItemId, Heap.MaxPrioHeap Similarity ItemId)]
createItemHeapList 0 _ = []
createItemHeapList itemNum itemId
    = (itemId, Heap.fromList [] :: Heap.MaxPrioHeap Similarity ItemId) : createItemHeapList (itemNum - 1) (itemId + 1)

-- * createItemSimilarityMap
createItemSimilarityMap :: Int -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
createItemSimilarityMap 0 = Map.fromList [] :: SimilarityMap
createItemSimilarityMap itemNum = Map.fromList $ createItemHeapList itemNum 1

-- # Functions for rating prediction
predictRating :: Matrix Rating
    -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
    -> UserId
    -> Int
    -> ItemId
    -> Rating
predictRating ratingMatrix simMap userId k itemId =
    case Map.lookup itemId simMap of 
        Just itemSimHeap -> 
            predictRatingHelper ratingMatrix itemSimList userId k (0::Double) (0::Double)
                where itemSimList = Heap.toAscList itemSimHeap
        Nothing ->
            error "Item does not exist"

predictRatingHelper :: Matrix Rating
    -> [(Similarity, ItemId)] -- Similarity List of the item that we are trying to predict
    -> UserId
    -> Int -- k
    -> Double -- numerator
    -> Double -- denominator
    -> Rating -- predicted rating
predictRatingHelper _ _ _ 0 numer deno 
    | deno == 0 = 0
    | otherwise = numer / deno
predictRatingHelper ratingMatrix [] userId k numer deno
    | deno == 0 = 0
    | otherwise = numer / deno
predictRatingHelper ratingMatrix ((sim, itemJ):xs) userId k numer deno
    | rUJ == 0 = predictRatingHelper ratingMatrix xs userId k numer deno
    | otherwise = predictRatingHelper ratingMatrix xs userId (k - 1) (numer + rUJ * sim) (deno + sim)
        where rUJ = getElem itemJ userId ratingMatrix

getRMSE :: Matrix Rating
    -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
    -> [RatingEntry]
    -> Int -- k
    -> Double -- sum
    -> Double -- count
    -> Double -- rmse
getRMSE _ _ [] _ s c
    | c == 0 = error "Count cannot be zero"
    | otherwise = s / c
getRMSE ratingMatrix itemSimMap (r:rs) k s c = 
    getRMSE ratingMatrix itemSimMap rs k s' c'
        where
            userId   = rUserId r
            itemId   = rItemId r
            rActual  = rRating r
            rPredict = predictRating ratingMatrix itemSimMap userId k itemId
            s' = s + (rPredict - rActual) * (rPredict - rActual)
            c' = c + 1::Double  


getPredictedRatingsByUser :: Matrix Rating
    -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
    -> UserId
    -> UserRating
    -> [Int] -- [1..1682]
    -> Int -- k
    -> [(Rating, ItemId)]
getPredictedRatingsByUser _ _ _ _ [] _ = []
getPredictedRatingsByUser ratingMatrix itemSimMap userId userRating (i:is) k
    | (userRating Vector.! (i-1)) == 0 = (predicted, i) : (getPredictedRatingsByUser ratingMatrix itemSimMap userId userRating is k)
    | otherwise = getPredictedRatingsByUser ratingMatrix itemSimMap userId userRating is k
        where predicted = predictRating ratingMatrix itemSimMap userId k i

getTopKRecommendationsForUserSeq :: [(Rating, ItemId)] -> Int -> [ItemId]
getTopKRecommendationsForUserSeq ratingItemPairs k 
    | length ratingItemPairs < k = error "Not enough unrated items"
    | otherwise = take k topItems
        where sortedRating = Heap.fromList ratingItemPairs :: Heap.MaxPrioHeap Rating ItemId
              topItems = map (snd) (Heap.toAscList sortedRating)

getTopKRecommendationsForUserPar1 :: [(Rating, ItemId)] -> Int -> [ItemId]
getTopKRecommendationsForUserPar1 ratingItemPairs k 
    | length ratingItemPairs < k = error "Not enough unrated items"
    | otherwise = take k topItems
        where sortedRating = Heap.fromList ratingItemPairs :: Heap.MaxPrioHeap Rating ItemId
              topItems = getTopItems1 (Heap.toAscList sortedRating)

getTopItems1 :: [(Rating, ItemId)] -> [ItemId]
getTopItems1 sortedRatingList = map (snd) sortedRatingList `using` parList rseq

getTopKRecommendationsForUserPar2 :: [(Rating, ItemId)] -> Int -> Int -> [ItemId]
getTopKRecommendationsForUserPar2 ratingItemPairs k chunkSize
    | length ratingItemPairs < k = error "Not enough unrated items"
    | otherwise = take k topItems
        where sortedRating = Heap.fromList ratingItemPairs :: Heap.MaxPrioHeap Rating ItemId
              topItems = getTopItems2 (Heap.toAscList sortedRating) chunkSize

getTopItems2 :: [(Rating, ItemId)] -> Int -> [ItemId]
getTopItems2 sortedRatingList chunkSize = map (snd) sortedRatingList `using` parListChunk chunkSize rseq