{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.T.Api where




import           Data.Aeson          (FromJSON, ToJSON (), Value (..), parseJSON, toJSON, object, (.=), (.:))
import           Data.Text           (Text)
import qualified Data.Text           as T
import           Data.Monoid         ((<>))
import           Haskell.Api.Helpers (QueryParam, qp)

instance FromJSON ApiRequest where
  parseJSON (Object o) = do
    apiRequestComment <- o .: ("comment" :: Text)
    apiRequestGuard <- o .: ("guard" :: Text)
    pure $ ApiRequest {
      apiRequestComment = apiRequestComment,
      apiRequestGuard = apiRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApiRequest where
  toJSON ApiRequest{..} = object $
    [ "tag" .= ("ApiRequest" :: Text)
    , "comment" .= apiRequestComment
    , "guard" .= apiRequestGuard
    ]


instance Eq ApiRequest where
  (==) a b = apiRequestComment a == apiRequestComment b && apiRequestGuard a == apiRequestGuard b

instance Show ApiRequest where
    show rec = "apiRequestComment: " <> show (apiRequestComment rec) <> ", " <> "apiRequestGuard: " <> show (apiRequestGuard rec)

instance FromJSON ApiResponse where
  parseJSON (Object o) = do
    apiResponseId <- o .: ("id" :: Text)
    apiResponseUserId <- o .: ("user_id" :: Text)
    apiResponseKey <- o .: ("key" :: Text)
    apiResponseComment <- o .: ("comment" :: Text)
    apiResponseGuard <- o .: ("guard" :: Text)
    apiResponseCreatedAt <- o .: ("created_at" :: Text)
    apiResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ ApiResponse {
      apiResponseId = apiResponseId,
      apiResponseUserId = apiResponseUserId,
      apiResponseKey = apiResponseKey,
      apiResponseComment = apiResponseComment,
      apiResponseGuard = apiResponseGuard,
      apiResponseCreatedAt = apiResponseCreatedAt,
      apiResponseModifiedAt = apiResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApiResponse where
  toJSON ApiResponse{..} = object $
    [ "tag" .= ("ApiResponse" :: Text)
    , "id" .= apiResponseId
    , "user_id" .= apiResponseUserId
    , "key" .= apiResponseKey
    , "comment" .= apiResponseComment
    , "guard" .= apiResponseGuard
    , "created_at" .= apiResponseCreatedAt
    , "modified_at" .= apiResponseModifiedAt
    ]


instance Eq ApiResponse where
  (==) a b = apiResponseId a == apiResponseId b && apiResponseUserId a == apiResponseUserId b && apiResponseKey a == apiResponseKey b && apiResponseComment a == apiResponseComment b && apiResponseGuard a == apiResponseGuard b && apiResponseCreatedAt a == apiResponseCreatedAt b && apiResponseModifiedAt a == apiResponseModifiedAt b

instance Show ApiResponse where
    show rec = "apiResponseId: " <> show (apiResponseId rec) <> ", " <> "apiResponseUserId: " <> show (apiResponseUserId rec) <> ", " <> "apiResponseKey: " <> show (apiResponseKey rec) <> ", " <> "apiResponseComment: " <> show (apiResponseComment rec) <> ", " <> "apiResponseGuard: " <> show (apiResponseGuard rec) <> ", " <> "apiResponseCreatedAt: " <> show (apiResponseCreatedAt rec) <> ", " <> "apiResponseModifiedAt: " <> show (apiResponseModifiedAt rec)

instance FromJSON ApiResponses where
  parseJSON (Object o) = do
    apiResponses <- o .: ("api_responses" :: Text)
    pure $ ApiResponses {
      apiResponses = apiResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApiResponses where
  toJSON ApiResponses{..} = object $
    [ "tag" .= ("ApiResponses" :: Text)
    , "api_responses" .= apiResponses
    ]


instance Eq ApiResponses where
  (==) a b = apiResponses a == apiResponses b

instance Show ApiResponses where
    show rec = "apiResponses: " <> show (apiResponses rec)
-- footer