module Main (main) where

import Control.Monad
import Data.Typeable(typeOf)

import System.Environment(getArgs, getProgName)
import System.Exit(die)
import qualified Data.Heap as Heap
import qualified Data.Matrix as Matrix
import qualified Data.Map as Map
import qualified Data.Vector as Vector
import Data.List
import Data.Time
import Control.Parallel.Strategies
import Control.Parallel
import Control.DeepSeq

import IOUtils (readRatingEntry, readMatrixData, printSimTuples)

import CFLib (
    getItemPairs,
    getSimTuplesStatic,
    getSimTuples0,
    createItemSimilarityMap,
    setItemSimilarityMap,
    getRMSE
    )

import CFDataStructures 

main :: IO ()
main = do
    args <- getArgs
    (dataNum, kString) <- case args of 
        [dataNum, kString] -> return (dataNum, kString)
        _ -> do pn <- getProgName
                die $ "Usage: " ++ pn ++ " <u-$number> <k>"

    let matrixPath = "../matrix_files"
    let mlPath = "../ml-100k"
    let filenameOri = matrixPath ++ "/original/" ++ dataNum ++ ".base"
    let filenameMc = matrixPath ++ "/mc/" ++ dataNum ++ ".base"
    let filenameTest = mlPath ++ "/" ++dataNum ++ ".test"

    let itemNum = 1682 :: Int
    let userNum = 943 :: Int
    let k = read kString :: Int

    ratingMatrixData <- readMatrixData filenameOri
    mcMatrixData <- readMatrixData filenameMc
    testData <- readRatingEntry filenameTest

    let ratingMatrix = Matrix.fromLists ratingMatrixData
    let meanCentered = Matrix.fromLists mcMatrixData
    let itemSimPairs = getItemPairs itemNum
    let itemSimTuples = getSimTuples0 meanCentered itemSimPairs
    let itemSimilarityMap0 = createItemSimilarityMap itemNum
    let itemSimilarityMap = setItemSimilarityMap itemSimilarityMap0 itemSimTuples
    let rmse = getRMSE ratingMatrix itemSimilarityMap testData k (0::Double) (0::Double)
    putStrLn $ "RMSE: " ++ (show rmse)