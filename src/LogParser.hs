module LogParser (parseMessage, build, inOrder, whatWentWrong) where

import Log (LogMessage (..), MessageTree (..), MessageType (..), TimeStamp)
import Utilities (isNotSpace, isSpace, stringSize)

getLogMessageTimeStamp :: LogMessage -> TimeStamp
getLogMessageTimeStamp (Unknown _) = 0
getLogMessageTimeStamp (LogMessage _ timeStamp _) = timeStamp

-- Exercise 1
parseMessage :: String -> LogMessage
parseMessage s
  | null s = Unknown ""
  | stringSize logType > 1 = Unknown s
  | head logType == 'I' = LogMessage Info (read timeStamp) message
  | head logType == 'W' = LogMessage Warning (read timeStamp) message
  | head logType == 'E' = LogMessage (Error (read errorSeverity)) (read errorTimeStamp) errorMessage
  | otherwise = Unknown s
  where
    logType = takeWhile isNotSpace s
    restAfType = dropWhile isSpace (dropWhile isNotSpace s)
    errorSeverity = takeWhile isNotSpace restAfType
    timeStamp = takeWhile isNotSpace restAfType
    restAfFrsArg = dropWhile isSpace (dropWhile isNotSpace restAfType)
    errorTimeStamp = takeWhile isNotSpace restAfFrsArg
    message = restAfFrsArg
    errorMessage = dropWhile isSpace (dropWhile isNotSpace restAfFrsArg)

-- Exercise 2
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert logMessage Leaf = Node Leaf logMessage Leaf
insert logMessage (Node leftTree nodeLogMessage rightTree)
  | logMessageTimeStamp <= nodeLogMessageTimeStamp = Node (insert logMessage leftTree) nodeLogMessage rightTree
  | otherwise = Node leftTree nodeLogMessage (insert logMessage rightTree)
  where
    logMessageTimeStamp = getLogMessageTimeStamp logMessage
    nodeLogMessageTimeStamp = getLogMessageTimeStamp nodeLogMessage

-- Exercise 3
build :: [LogMessage] -> MessageTree
build = foldr insert Leaf

-- Exercise 4
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node leftTree logMessage rightTree) = inOrder leftTree ++ [logMessage] ++ inOrder rightTree

-- Exercise 5
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong = map getMessage . filter isSevereError
  where
    getMessage (LogMessage _ _ message) = message
    getMessage (Unknown message) = message
    isSevereError (LogMessage (Error severity) _ _) = severity >= 50
    isSevereError _ = False
