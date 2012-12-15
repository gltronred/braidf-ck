
module Interpreter where

import Types

run :: Braid -> Data -> Data
run braid inp = let
  padded = pad inp $ w+o
  i = input braid
  w = work braid
  o = output braid
  in unpad (i+w) $ execute braid padded

pad :: Data -> Int -> Data
pad inp add = inp

unpad :: Int -> Data -> Data
unpad del (Data out) = Data $ drop del out

execute :: Braid -> Data -> Data
execute braid d = d

