module LogParser (parseMessage) where

import Log (LogMessage (..), MessageType (..))
import Utilities (isNotSpace, isSpace, stringSize)

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
