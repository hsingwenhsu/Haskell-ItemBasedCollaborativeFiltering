module Main (main) where

import Control.Monad
import Data.Typeable(typeOf)

import System.Environment(getArgs, getProgName)
import System.Exit(die)
import qualified Data.Heap as Heap
import qualified Data.Matrix as Matrix
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Data.Time
import Control.Parallel.Strategies

import IOUtils (readRatingEntry, readMatrixData, printSimTuples)

import CFLib (
    getItemPairs,
    getSimTuplesPar2,
    createItemSimilarityMap,
    setItemSimilarityMap,
    getPredictedRatingsByUser,
    getTopKRecommendationsForUserPar2,
    getRMSE
    )

import CFDataStructures 

main :: IO ()
main = do
    args <- getArgs
    (userIdString, recKString, simKString, chunkSizeString) <- case args of 
        [userIdString, recKString, simKString, chunkSizeString] -> return (userIdString, recKString, simKString, chunkSizeString)
        _ -> do pn <- getProgName
                die $ "Usage: " ++ pn ++ " <userid> <recommend-item-num> <knum-for-prediction> <chunkSize>"

    let matrixPath = "matrix_files/"
    let dataName = "u.data"
    let filenameOri = matrixPath ++ "original/" ++ dataName
    let filenameMc = matrixPath ++ "mc/" ++ dataName

    let itemNum = 1682 :: Int
    let k = read simKString :: Int -- the number of items that we used to predict the rating
    let queryUserId = read userIdString :: UserId
    let topK = read recKString :: Int -- the number of items that we want to recommend to the user
    let chunkSize = read chunkSizeString :: Int
    let allItems = [1..1682]
    -- read raw data
    ratingMatrixData <- readMatrixData filenameOri
    mcMatrixData <- readMatrixData filenameMc

    -- convert data to matrices
    let ratingMatrix = Matrix.fromLists ratingMatrixData
    let meanCentered = Matrix.fromLists mcMatrixData

    -- compute item similarity map
    let itemSimPairs = getItemPairs itemNum
    time1 <- itemSimPairs `seq` getCurrentTime
    let itemSimTuples = getSimTuplesPar2 meanCentered itemSimPairs chunkSize
    time2 <- itemSimTuples `seq` getCurrentTime
    

    let itemSimilarityMap0 = createItemSimilarityMap itemNum
    let itemSimilarityMap = setItemSimilarityMap itemSimilarityMap0 itemSimTuples
    time3 <- itemSimilarityMap `seq` getCurrentTime
    
    let userRating = (Matrix.getCol queryUserId ratingMatrix) :: UserRating
    time4 <- userRating `seq` getCurrentTime
    
    let predictedRatings = getPredictedRatingsByUser ratingMatrix itemSimilarityMap queryUserId userRating allItems k
    time5 <- predictedRatings `seq` getCurrentTime
    
    let recommendedItems = getTopKRecommendationsForUserPar2 predictedRatings topK chunkSize
    time6 <- recommendedItems `seq` getCurrentTime
    
    putStrLn $ "Recommended Items: "
    print recommendedItems
    putStrLn $ "Compute Item Similiarty: " ++ (show (diffUTCTime time2 time1))
    putStrLn $ "Construct Item Similarity Map: " ++ (show (diffUTCTime time3 time2))
    putStrLn $ "Compute Predicted Ratings: " ++ (show (diffUTCTime time5 time4))
    putStrLn $ "Get Recommended Items: " ++ (show (diffUTCTime time6 time5))