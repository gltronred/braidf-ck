
module Parser where

import Data.Maybe
import Text.Parsec

import Types

number = many1 digit >>= return . read

sigma = optionMaybe (char '-') >>= \sign -> number >>= return . (if isJust sign then Tau else Sigma) . ((-) 1)

braidDescription = do
  input <- number
  spaces
  work <- number
  spaces
  output <- number
  return (input,work,output)

simple = string "Palm" >> return (Braid 0 0 0 [])

simplified = try (string "Lines") >> return (Braid 0 0 0 [])

math = do
  string "L33t"
  spaces
  (i,w,o) <- braidDescription
  newline
  s <- sigma`sepBy`space
  return (Braid i w o s)

program :: Parsec String () Braid
program = do
  string "Braid 0.1"
  newline
  simple <|> simplified <|> math

