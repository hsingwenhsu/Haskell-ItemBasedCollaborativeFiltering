module IOUtils (
    readRatingEntry,
    readMatrixData,
    printItemSimilarityMap,
    printSimTuples
) where 

import System.IO ( IO, Handle, hIsEOF, withFile, IOMode(ReadMode), hGetLine)
import System.Environment(getArgs, getProgName)
import System.Exit(die)
import Prelude
import qualified Data.Heap as Heap
import qualified Data.Map as Map

import CFDataStructures

readTableFileLambda :: Handle -> (Handle -> IO a) -> IO [a]
readTableFileLambda hdl getFunc = do
  t <- hIsEOF hdl
  if t then return []
  else do
    x <- getFunc hdl-- x is a string
    fmap ([x] ++) (readTableFileLambda hdl getFunc)

readTableFile :: String -> (Handle -> IO a) -> IO [a]
readTableFile fname getFunc = do
    withFile fname ReadMode $ \hdl -> readTableFileLambda hdl getFunc

readRatingEntry :: String -> IO [RatingEntry]
readRatingEntry filename = readTableFile filename getRatingEntry

getRatingEntry :: Handle -> IO RatingEntry
getRatingEntry h = do 
    inputs <- hGetLine h
    let entry = words inputs
    case entry of 
        [uid, iid, rating, _] ->
            do return $ RatingEntry (read uid :: Int) (read iid :: Int) (read rating :: Double)
        _       -> error "malformed input"

readMatrixData :: String -> IO[[Rating]]
readMatrixData filename = readTableFile filename getMatrixRow

getMatrixRow :: Handle -> IO [Rating]
getMatrixRow h = do
    inputs <- hGetLine h 
    let rowString = words inputs
    let rowRating = map (\x -> read x :: Double) rowString
    return rowRating

printItemSimilarityMap :: Map.Map ItemId (Heap.MaxPrioHeap Similarity ItemId) -> IO ()
printItemSimilarityMap m = mapM_ print m

printSimTuples :: [(ItemId, ItemId, Similarity)] -> IO ()
printSimTuples simTuples = mapM_ print simTuples