module Main (main) where

import LogParser (parseMessage)

main :: IO ()
main = print (parseMessage "I 0 a")
