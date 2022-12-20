module CFDataStructures (
    Rating,
    UserId,
    ItemId,
    ItemRating,
    UserRating,
    Similarity,
    ItemSimHeap,
    SimilarityMap,
    RatingEntry (..)    
) where

import qualified Data.Heap as Heap
import qualified Data.Matrix as Matrix
import qualified Data.Map as Map
import Data.Vector

type Rating = Double
type UserId = Int
type ItemId = Int
type ItemRating = Vector Rating
type UserRating = Vector Rating 
type Similarity = Double
type ItemSimHeap = Heap.MaxPrioHeap Similarity ItemId
type SimilarityMap = Map.Map ItemId ItemSimHeap

data RatingEntry = RatingEntry {
    rUserId :: UserId,
    rItemId :: ItemId,
    rRating :: Rating    
} deriving (Eq, Show)