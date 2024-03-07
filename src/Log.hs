module Log (LogMessage (..), MessageTree (..), TimeStamp, MessageType (..)) where

type TimeStamp = Int

data MessageType
  = Info
  | Warning
  | Error Int
  deriving (Show, Eq)

data LogMessage
  = LogMessage MessageType TimeStamp String
  | Unknown String
  deriving (Show, Eq)

data MessageTree
  = Leaf
  | Node MessageTree LogMessage MessageTree
  deriving (Show, Eq)
