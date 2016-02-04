{-# LANGUAGE DeriveGeneric #-}
module Catan.Types where

import Data.Map (Map)
import GHC.Generics (Generic)

import Types (ID)
import Grid (Hex,Vertex,Edge)


data Catan = Catan 
    { game_board :: Board 
    , game_data  :: [PlayerData] 
    , game_turn  :: Player }
    deriving (Show, Eq, Generic)

data PlayerData = PlayerData Player Resources
    deriving (Show, Eq, Generic)

type Player = ID

type Owned a = (Player,a)

data Status = Accepted | Rejected | Pending
    deriving (Show,Eq,Generic)

data TradeOffer = TradeOffer
    { tradeoffer_sender     :: Player
    , tradeoffer_receiver   :: Player
    , tradeoffer_offer      :: Resources
    , tradeoffer_request    :: Resources 
    , tradeoffer_status     :: Status }
    deriving (Show, Eq, Generic)

data Resources = Resource 
    { wheat  :: Int
    , sheep  :: Int
    , wood   :: Int
    , iron   :: Int
    , bricks :: Int }
    deriving (Show, Eq, Generic)
--data Resource = Wheat | Flock | Lumber | IronOre | Bricks
 --   deriving (Show, Eq, Generic)

data Building = House | City
    deriving (Show, Eq, Generic)
type Road = ()
data Tile = Tile Bool Int Terrain
    deriving (Show, Eq, Generic)
data Terrain = Grain | Sheep | Wood | Iron | Brick | Desert | Sea
    deriving (Show, Eq, Enum, Generic)

type Board = ( Map Vertex (Owned Building)
             , Map Edge (Owned Road)
             , Map Hex Tile)
