{-# LANGUAGE DeriveGeneric #-}
module Catan.PersistentTypes where
import Data.Binary
import Data.Aeson
import Data.Time.Clock
import Data.ByteString (ByteString)
import GHC.Generics (Generic)

import Catan.Types
import Types

instance Binary Building
instance Binary Terrain
instance Binary Tile
instance Binary Resources
instance Binary PlayerData
instance Binary Catan

instance Binary Status
instance Binary TradeOffer

data StoredTradeOffer = StoredTradeOffer 
    { tradeoffer_id :: ID
    , tradeoffer_game_id :: ID
    , trader_id :: ID
    , target_id :: ID
    , tradeoffer_date :: UTCTime
    , tradeoffer_data :: ByteString
    }
    deriving (Eq, Show)

data Registration = Registration 
    { registration_game_id :: ID
    , registration_player :: ID }
    deriving (Eq, Show)
    
data Game = Game
    { game_id :: ID
    , game_data :: ByteString }
    deriving (Eq, Show)

data ReturnData = ReturnData
    { return_gameid :: ID
    , return_players :: [(Player,String)]
    , return_board :: Board
    , return_playerdata :: PlayerData 
    , return_tradeoffers :: [TradeOffer]}
    deriving (Eq, Show, Generic)

