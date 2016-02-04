{-# LANGUAGE DeriveGeneric #-}

module Types where
import Data.Aeson
import Data.Time.Clock
import Data.ByteString (ByteString)
import GHC.Generics

type ID = Int
type SID = Int
type UID = Int
type Token = String

data Plaintext = Plaintext String String
    deriving (Ord, Eq, Show, Generic)

data SessionToken = 
    SessionToken {
        sessionId :: ID, 
        sessionToken :: Token
        }
    deriving (Ord, Eq, Show, Generic)


data AppError = UserExists | InvalidCredentials
    deriving (Eq,Show)

type Password = ByteString

data User = User 
    { user_id :: ID 
    , user_alias :: String
    , user_pass :: String
    , user_name :: String
    , user_email :: String
    , user_phone :: Maybe String
    , user_address :: Maybe String
    , user_registration_time :: UTCTime
    }
    deriving (Eq, Show, Generic)

instance ToJSON User
instance FromJSON User


