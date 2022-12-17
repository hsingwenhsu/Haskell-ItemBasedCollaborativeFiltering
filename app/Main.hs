module Main (main) where

import Control.Monad
import Data.Typeable(typeOf)

import System.Environment(getArgs, getProgName)
import qualified Data.Heap as Heap
import qualified Data.Matrix as Matrix
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Data.Time
import Control.Parallel.Strategies

import IOUtils (readRatingEntry, readMatrixData, printSimTuples)
import RecommendationLib (
    getTopRatedItemsByUser,
    getItemTopK,
    getRecommenededItemsForUser
    )

import CFLib (
    getItemPairs,
    getSimTuples,
    getSimTuplesPar2,
    getItemSimilarityMap,
    getItemSimilarityMapPar,
    createItemSimilarityMap,
    setItemSimilarityMap,
    getRMSE
    )

import CFDataStructures 
import SimilarityLib

main :: IO ()
main = do
    let matrixPath = "matrix_files/"
    let dataName = "u.data"
    let filenameOri = matrixPath ++ "original/" ++ dataName
    let filenameMc = matrixPath ++ "mc/" ++ dataName

    let itemNum = 1682 :: Int
    let userNum = 943 :: Int
    let users = [1..userNum]
    let k = 3 :: Int

    -- read raw data
    ratingMatrixData <- readMatrixData filenameOri
    mcMatrixData <- readMatrixData filenameMc

    -- convert data to matrices
    let ratingMatrix = Matrix.fromLists ratingMatrixData
    let meanCentered = Matrix.fromLists mcMatrixData

    -- compute item similarity map
    let itemSimPairs = getItemPairs itemNum
    startTime <- itemSimPairs `seq` getCurrentTime
    let itemSimTuples = getSimTuplesPar2 meanCentered itemSimPairs
    endTime <- itemSimTuples `seq` getCurrentTime
    putStrLn $ "Compute Item Similarity: " ++ (show (diffUTCTime endTime startTime))
    
    let itemSimilarityMap0 = createItemSimilarityMap itemNum
    let itemSimilarityMap = setItemSimilarityMap itemSimilarityMap0 itemSimTuples

    -- recommend items for users
    startTime2 <- itemSimilarityMap `seq` getCurrentTime
    let recLists = map (getRecommenededItemsForUser ratingMatrix itemSimilarityMap k) users `using` parList rseq
    endTime2 <- recLists `seq` getCurrentTime
    putStrLn $ "Get Recommendations For all Users: " ++ (show (diffUTCTime endTime2 startTime2))