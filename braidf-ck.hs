
module Main where

import System.Environment
import Text.Parsec (parse)

import Types
import Parser
import Interpreter

main = do
  args <- getArgs
  if length args == 0
    then putStrLn $ "Usage: " ++ "<program> <input>"
    else do
    progText <- readFile $ args!!0
    let (Right prog) = parse program (args!!0) progText
    inputText <- readFile $ args!!1 
    let (Right inp) = parse inputData (args!!1) inputText
    print $ run prog inp

