module Main (main) where

import Control.Monad
import System.Environment(getArgs, getProgName)
import System.Exit(die)
import qualified Data.Heap as Heap
import qualified Data.Matrix as Matrix
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import qualified Data.List as List
import Data.Time
import Control.Parallel.Strategies
import Control.DeepSeq
import IOUtils

import CFLib (
    getItemPairs,
    getSimTuples0,
    createItemSimilarityMap,
    setItemSimilarityMap,
    getPredictedRatings0,
    filterRatingItemPairs,
    sort0,
    getTopK
    )

import CFDataStructures 

-- parList rseq
main :: IO ()
main = do
    args <- getArgs
    (userIdString, recKString, predictKString) <- case args of 
        [userIdString, recKString, predictKString] -> return (userIdString, recKString, predictKString)
        _ -> do pn <- getProgName
                die $ "Usage: " ++ pn ++ " <userid> <rec-num> <predict-num>"

    let matrixPath = "matrix_files/"
    let dataName = "u.data"
    let filenameOri = matrixPath ++ "original/" ++ dataName
    let filenameMc = matrixPath ++ "mc/" ++ dataName

    let itemNum = 1682 :: Int
    let k = read predictKString :: Int -- the number of items that we used to predict the rating
    let queryUserId = read userIdString :: UserId
    let topK = read recKString :: Int -- the number of items that we want to recommend to the user
    let allItems = force([(1::ItemId)..1682])
    -- read raw data
    ratingMatrixData <- readMatrixData filenameOri
    mcMatrixData <- readMatrixData filenameMc

    -- convert data to matrices
    let ratingMatrix = Matrix.fromLists ratingMatrixData
    let meanCentered = Matrix.fromLists mcMatrixData
    let userRating = (Matrix.getCol queryUserId ratingMatrix) :: UserRating

    -- compute item similarity map
    let itemSimPairs = getItemPairs itemNum
    time1 <- itemSimPairs `seq` getCurrentTime
    let itemSimTuples = getSimTuples0 meanCentered itemSimPairs
    time2 <- itemSimTuples `seq` getCurrentTime
    
    let itemSimilarityMap0 = createItemSimilarityMap itemNum
    let itemSimilarityMap = setItemSimilarityMap itemSimilarityMap0 itemSimTuples
    time3 <- itemSimilarityMap `seq` getCurrentTime
    
    let predictedRatings = getPredictedRatings0 ratingMatrix itemSimilarityMap queryUserId userRating allItems k
    let predictedRatingItemPairs = zipWith (,) predictedRatings allItems
    time4 <- predictedRatingItemPairs `seq` getCurrentTime
    
    let sortedRatingItemPairs = sort0 predictedRatingItemPairs
    time5 <- sortedRatingItemPairs `seq` getCurrentTime

    let filteredItems = filterRatingItemPairs sortedRatingItemPairs userRating
    time6 <- filteredItems `seq` getCurrentTime
    
    -- let recommendedItems = take topK (map (snd) sortedRatings `using` parList rseq)
    let recommendedItems = getTopK filteredItems topK
    time7 <- recommendedItems `seq` getCurrentTime
    
    putStrLn $ "Recommended Items: "
    print recommendedItems
    putStrLn $ "item_sim_pairs " ++ (show (diffUTCTime time2 time1))
    putStrLn $ "item_sim_map " ++ (show (diffUTCTime time3 time2))
    putStrLn $ "predict_ratings " ++ (show (diffUTCTime time4 time3))
    putStrLn $ "sort_ratings " ++ (show (diffUTCTime time5 time4))
    putStrLn $ "filter_items " ++ (show (diffUTCTime time6 time5))
    putStrLn $ "get_topk " ++ (show (diffUTCTime time7 time6))

