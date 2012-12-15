
module Parser where

import Data.Maybe
import Text.Parsec

import Types

number = many1 digit >>= return . read

signed = do
  sign <- optionMaybe $ char '-'
  x <- number
  return $ if isJust sign then -x else x

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
  s <- signed`sepBy`space >>= return . map (\x -> (abs x, x>0))
  return (Braid i w o s)

program :: Parsec String () Braid
program = do
  string "Braid 0.1"
  newline
  simple <|> simplified <|> math

