module Catan where
import Data.Map (Map, fromList)
import System.Random

import Grid

type Owned a = (ID,a)

data Resource = Wheat | Flock | Lumber | IronOre | Bricks

data Building = House | City
    deriving (Show, Eq)
type Road = ()
data Tile = Tile Bool Int Terrain
    deriving (Show, Eq)
data Terrain = Grain | Sheep | Wood | Iron | Brick | Desert | Sea
    deriving (Show, Eq, Enum)

type Board = ( Map Vertex (Owned Building)
             , Map Edge (Owned Road)
             , Map Hex Tile)

-- random gen in range of dice rolls
-- Will not generate desert or sea tiles
randomTile :: RandomGen g => g -> (Tile,g)
randomTile gen = let (r1,gen')  = next gen
                     (r2,gen'') = next gen' in
    (Tile False (mod r1 13) . toEnum $ mod r2 5,gen'')

-- random gen in range of dice rolls
newBoard :: RandomGen g => g -> Int -> (Board,g)
newBoard gen s = let (tiles,gen') = foldr addNewTile ([],gen) $ hexHex s in
    (   ( fromList []
        , fromList []
        , fromList tiles)
    , gen')
    where
        addNewTile h (ts,g) = let (t,g') = randomTile g in
            ((h,t) : ts,g')
