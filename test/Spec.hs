import Log (LogMessage (..), MessageType (..))
import LogParser (parseMessage)
import Test.QuickCheck (Property, Testable (property), quickCheck)

testInfoMessage :: Property
testInfoMessage =
  let message = "I 0 a"
      expected = LogMessage Info 0 "a"
   in property $ parseMessage message == expected

testWarningMessage :: Property
testWarningMessage =
  let message = "W 0 a"
      expected = LogMessage Warning 0 "a"
   in property $ parseMessage message == expected

testErrorMessage :: Property
testErrorMessage =
  let message = "E 2 0 a"
      expected = LogMessage (Error 2) 0 "a"
   in property $ parseMessage message == expected

testUnknownMessage :: Property
testUnknownMessage =
  let message = "a"
      expected = Unknown "a"
   in property $ parseMessage message == expected

testEmptyMessage :: Property
testEmptyMessage =
  let message = ""
      expected = Unknown ""
   in property $ parseMessage message == expected

main :: IO ()
main = do
  quickCheck testInfoMessage
  quickCheck testWarningMessage
  quickCheck testErrorMessage
  quickCheck testUnknownMessage
  quickCheck testEmptyMessage
  putStrLn "All tests passed!"
