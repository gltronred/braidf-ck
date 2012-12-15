
module Main where

import System.Environment

import Types
import Parser
import Interpreter

main = do
  args <- getArgs
  print args

