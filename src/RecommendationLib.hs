module RecommendationLib (
    getTopRatedItemsByUser,
    getItemTopK,
    getRecommenededItemsForUser
) where 

import Control.Monad

import qualified Data.Heap as Heap
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Data.Matrix
import Data.Vector

import CFDataStructures
import CFLib

getRatingItemPairsByUser :: Matrix Rating -> UserId -> [(Rating, ItemId)]
getRatingItemPairsByUser ratingMatrix userId = Vector.toList $ fmap (id) ratedItemsMaybe
    where userRating = getCol userId ratingMatrix
          ratedItemsMaybe = imapMaybe(\idx r
            -> if r > 0 then Just (r, idx + 1) else Nothing) userRating

getTopRatedItemsByUser :: Matrix Rating -> UserId -> [ItemId]
getTopRatedItemsByUser ratingMatrix userId =
        Prelude.map snd $ (Prelude.filter (\(r, i) -> r >= 3) (Heap.toAscList ratingItemHeap))
    where ratingItemPairs = getRatingItemPairsByUser ratingMatrix userId
          ratingItemHeap = Heap.fromList ratingItemPairs :: Heap.MaxPrioHeap Rating ItemId
          
getItemTopK :: Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId) -- itemSimilarityMap
    -> Int -- k
    -> ItemId
    -> [ItemId]
getItemTopK itemSimMap k itemId = 
    case Map.lookup itemId itemSimMap of 
        Just itemSimHeap -> 
            Prelude.take k $ (Prelude.map snd $ Heap.toAscList itemSimHeap)
        Nothing -> 
            error "Item does not exist"

-- recommand a list of items for the specified user
getRecommenededItemsForUser :: Matrix Rating 
    -> Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId)
    -> Int -- k
    -> UserId
    -> [ItemId]
getRecommenededItemsForUser ratingMatrix itemSimMap k userId = Prelude.concat recommendedLists
    where topRatedItems = getTopRatedItemsByUser ratingMatrix userId
          recommendedLists = fmap (getItemTopK itemSimMap k) topRatedItems
