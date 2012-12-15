
module Parser where

import Text.Parsec

import Types

simple = string "Palm" >> return (Braid 0 0 0 [])

simplified = try (string "Lines") >> return (Braid 1 0 0 [])

math = string "L33t" >> return (Braid 2 0 0 [])

program :: Parsec String () Braid
program = do
  string "Braid 0.1"
  newline
  simple <|> simplified <|> math

