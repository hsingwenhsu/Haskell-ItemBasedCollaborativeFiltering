module SimilarityLib (
    getCosSimilarity
) where

import Prelude
import qualified Data.Vector as Vector
import Data.Matrix
import CFDataStructures

getDotProduct :: ItemRating -> ItemRating -> Double
getDotProduct ir1 ir2 = Vector.sum $ Vector.zipWith (\x y -> x * y) ir1 ir2

getVectorLen :: ItemRating -> Double
getVectorLen ir = sqrt $ (Vector.sum $ Vector.zipWith (\x y -> x * y) ir ir)

getCosSimilarityHelper :: ItemRating -> ItemRating -> Similarity
getCosSimilarityHelper ir1 ir2
    | dotProduct == 0 = 0
    | vecLen1 == 0 = 0
    | vecLen2 == 0 = 0
    | otherwise = dotProduct / (vecLen1 * vecLen2)
      where dotProduct = getDotProduct ir1 ir2
            vecLen1    = getVectorLen ir1
            vecLen2    = getVectorLen ir2

getCosSimilarity :: Matrix Rating -> ItemId -> ItemId -> Similarity
getCosSimilarity mc iid1 iid2 = 
    getCosSimilarityHelper (getRow iid1 mc) (getRow iid2 mc)