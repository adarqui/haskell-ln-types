{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.T.Pack.Team where




import           Data.Aeson          (FromJSON, ToJSON (), Value (..), parseJSON, toJSON, object, (.=), (.:))
import           Data.Text           (Text)
import qualified Data.Text           as T
import           Data.Monoid         ((<>))
import           Haskell.Api.Helpers (QueryParam, qp)

instance FromJSON TeamPackResponse where
  parseJSON (Object o) = do
    teamPackResponseUser <- o .: ("user" :: Text)
    teamPackResponseUserId <- o .: ("user_id" :: Text)
    teamPackResponseTeam <- o .: ("team" :: Text)
    teamPackResponseTeamId <- o .: ("team_id" :: Text)
    teamPackResponseStat <- o .: ("stat" :: Text)
    teamPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ TeamPackResponse {
      teamPackResponseUser = teamPackResponseUser,
      teamPackResponseUserId = teamPackResponseUserId,
      teamPackResponseTeam = teamPackResponseTeam,
      teamPackResponseTeamId = teamPackResponseTeamId,
      teamPackResponseStat = teamPackResponseStat,
      teamPackResponsePermissions = teamPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamPackResponse where
  toJSON TeamPackResponse{..} = object $
    [ "tag" .= ("TeamPackResponse" :: Text)
    , "user" .= teamPackResponseUser
    , "user_id" .= teamPackResponseUserId
    , "team" .= teamPackResponseTeam
    , "team_id" .= teamPackResponseTeamId
    , "stat" .= teamPackResponseStat
    , "permissions" .= teamPackResponsePermissions
    ]


instance Eq TeamPackResponse where
  (==) a b = teamPackResponseUser a == teamPackResponseUser b && teamPackResponseUserId a == teamPackResponseUserId b && teamPackResponseTeam a == teamPackResponseTeam b && teamPackResponseTeamId a == teamPackResponseTeamId b && teamPackResponseStat a == teamPackResponseStat b && teamPackResponsePermissions a == teamPackResponsePermissions b

instance Show TeamPackResponse where
    show rec = "teamPackResponseUser: " <> show (teamPackResponseUser rec) <> ", " <> "teamPackResponseUserId: " <> show (teamPackResponseUserId rec) <> ", " <> "teamPackResponseTeam: " <> show (teamPackResponseTeam rec) <> ", " <> "teamPackResponseTeamId: " <> show (teamPackResponseTeamId rec) <> ", " <> "teamPackResponseStat: " <> show (teamPackResponseStat rec) <> ", " <> "teamPackResponsePermissions: " <> show (teamPackResponsePermissions rec)

instance FromJSON TeamPackResponses where
  parseJSON (Object o) = do
    teamPackResponses <- o .: ("team_pack_responses" :: Text)
    pure $ TeamPackResponses {
      teamPackResponses = teamPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamPackResponses where
  toJSON TeamPackResponses{..} = object $
    [ "tag" .= ("TeamPackResponses" :: Text)
    , "team_pack_responses" .= teamPackResponses
    ]


instance Eq TeamPackResponses where
  (==) a b = teamPackResponses a == teamPackResponses b

instance Show TeamPackResponses where
    show rec = "teamPackResponses: " <> show (teamPackResponses rec)
-- footer