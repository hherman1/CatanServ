module Catan where
import Data.Map (Map, fromList)
import System.Random
import Types
import Catan.Types

import Grid


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
