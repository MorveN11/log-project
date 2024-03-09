import Log (LogMessage, MessageTree)
import LogParser (build, inOrder, parseMessage, whatWentWrong)

testWhatWentWrong ::
  (String -> LogMessage) ->
  ([LogMessage] -> MessageTree) ->
  (MessageTree -> [LogMessage]) ->
  ([LogMessage] -> [String]) ->
  FilePath ->
  IO [String]
testWhatWentWrong parse builder getMessage checkWhatWentWrong file =
  checkWhatWentWrong . getMessage . builder . map parse . lines <$> readFile file

main :: IO ()
main = do
  testWhatWentWrong parseMessage build inOrder whatWentWrong "docs/sample.log" >>= print
  testWhatWentWrong parseMessage build inOrder whatWentWrong "docs/log_file.log" >>= print
