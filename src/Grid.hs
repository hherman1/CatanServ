module Grid where

-- Coordinate system for Vertices/edges on a Hexagonal Grid
--Vertices have triangular coordinates
--
type Vertex = (Int,Int)
type Edge = (Vertex,Vertex)
type Hex = (Int,Int)

data Direction = North
               | Northeast
               | East
               | Southeast
               | South
               | Southwest
               | West
               | Northwest
    deriving (Show,Eq)

edge = (,)

vertexHexes :: Vertex -> [(Direction,Hex)]
vertexHexes (x,y) = let y' = div y 2 in
    if even y then
        [(Southeast,(x,y'))
        ,(Southwest,(x-1,y'))
        ,(North,(x-1,y'+1))]
    else
        [(South,(x,y'))
        ,(Northeast,(x,y'+1))
        ,(Northwest,(x-1,y'+1))]


edgeHexes :: Edge -> [(Direction,Hex)]
edgeHexes ((x1,y1),(x2,y2)) = let (y1',y2') = (div y1 2,div y2 2) in
    if y1 + 1 == y2 then
        if even x1 then
            [(Southeast,(x1,y1')),(Northwest,(x1-1,y1'+1))]
        else 
            [(East,(x1,y1'+1)),(West,(x1-1,y1'+1))]
    else 
        [(North,(x1-1,y1'+1)),(South,(x1-1,y1'))]
            

vertices :: Hex -> [(Direction,Vertex)]
vertices (x,y) =
        [(Northwest,(x,2*y))
        ,(North,(x,2*y+1))
        ,(Southwest,(x,2*y-1))
        ,(Northeast,(x+1,2*y))
        ,(Southeast,(x+1,2*y-1))
        ,(South,(x+1,2*y-2))]
        
hexHex :: Int -> [Hex]
hexHex s = [(x,y) | y <- [-s + 1 .. s-1], 
                    x <- f y]
    where
        f y = if y <= 0 then
                [-s + 1 - y .. s - 1]
            else
                [-s+1..s-1 - y]
-- Hollow Hexagon
ringHex :: Int -> [Hex]
ringHex s = 
       [(x,-s + 1)  | x <- [0..s-1]]
    ++ [(x,s-1)     | x <- [-s + 1..0]]
    ++ [(x,y)       | y <- [-s + 2 .. s-2], x <- f y]
    where
        f y = if y <= 0 then
                [-s + 1 - y, s - 1]
            else
                [-s+1, s-1 - y]
