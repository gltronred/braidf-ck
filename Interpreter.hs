
module Interpreter where

import Data.List

import Types

run :: Braid -> Data -> Data
run braid inp = let
  padded = pad inp $ w+o
  i = input braid
  w = work braid
  o = output braid
  in unpad (i+w) $ execute braid padded

pad :: Data -> Int -> Data
pad (Data inp) add = Data $ inp ++ replicate add idPerm

unpad :: Int -> Data -> Data
unpad del (Data out) = Data $ drop del out

execute :: Braid -> Data -> Data
execute braid d = foldl' (flip apply) d $ sigmas braid

apply :: Crossing -> Data -> Data
apply (Sigma x) (Data d) = let
  a = d!!x
  b = d!!(x+1)
  aba = (a /*/ b) /*/ inverse a
  in Data $ change (x,aba) $ change (x+1,a) d
apply (Tau x) (Data d) = let
  a = d!!x
  b = d!!(x+1)
  bab = (inverse b /*/ a) /*/ b
  in Data $ change (x,b) $ change (x+1,bab) d

change (i,newX) xs = take i xs ++ (newX : drop (i+1) xs)

getPos :: Int -> Perm -> Int
getPos x (Perm p) = let
  cs = filter (x`elem`) p
  c = head cs
  in if null cs 
     then x
     else (!!1) $ dropWhile (/=x) $ c ++ c

idPerm :: Perm
idPerm = Perm []

(/*/) :: Perm -> Perm -> Perm
(Perm a) /*/ (Perm b) = let
  elems = nub $ sort $ concat a ++ concat b
  orbit x = x : takeWhile (/=x) (orbit $ getPos (getPos x $ Perm a) $ Perm b)
  orbits [] = []
  orbits elems = orb : orbits (elems \\ orb) where orb = orbit $ head elems
  in Perm $ filter ((>1).length) $ orbits elems

inverse :: Perm -> Perm
inverse = Perm . map reverse . cycles

-- sigma i n | i>=n || i<=0 = error $ "Wrong sigma: " ++ show i ++ "," ++ show n
-- sigma i' n = [0..i-1] ++ [i+1,i] ++ [i+2..n-1] where i = i'-1

