module Utilities (stringSize, isNotSpace, isSpace) where

stringSize :: String -> Int
stringSize = foldr (\_ -> (+) 1) 0

isNotSpace :: Char -> Bool
isNotSpace = (/= ' ')

isSpace :: Char -> Bool
isSpace = (== ' ')
