module Lib
    ( someFunc,
      readDataset
    ) where

import System.IO
import System.Environment(getArgs, getProgName)
import System.Exit(die)
import Prelude
import Data.Map(Map)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

rawDataToList :: [[String]] -> [(Int, Int, Double)]
rawDataToList [] = []
rawDataToList raw_data = map (\x -> ((read (x!!0)::Int, read(x!!1)::Int, read(x!!2)::Double))) raw_data

readDataset :: IO ()
readDataset = do
    args <- getArgs
    (filename_base, filename_test) <- case args of
        [filename_base, filename_test] -> return (filename_base, filename_test)
        _ -> do pn <- getProgName
                die $ "Usage: " ++ pn ++ "<train-filename> <test-filename>"
    handle <- openFile filename_base ReadMode
    contents <- hGetContents handle
    let rows = lines contents
    let raw_data = map (words) rows
    let uir_tuples = rawDataToList raw_data
    print (uir_tuples !! 0)


