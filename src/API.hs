{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}

module API where

import Data.Aeson
import Data.Time.Clock
import GHC.Generics
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Types
import Auth


type API = RequestSession :<|> UserApi 



type AuthApi = "auth" :> SessionApi

type SessionApi = "session" :> (RequestSession :<|> EndSession)

type RequestSession = Header "Authorization" Plaintext :> "get" :> Get '[JSON] (Headers '[Header "Set-Cookie" (SessionToken,UTCTime)] ())

type EndSession = WithAuth :> "delete" :> Get '[JSON] (Headers '[Header "Set-Cookie" (SessionToken,UTCTime)] ())


type UserApi = "users" :> (CreateUser :<|> GetUser :<|> DeleteUser)

type CreateUser = "create" :> ReqBody '[JSON] User :> Post '[JSON] (Maybe String)

type GetUser = WithAuth :> "get" :> Capture "uid" UID :> Get '[JSON] (Maybe User)

type DeleteUser = WithAuth :> "delete" :> Delete '[JSON] ()



