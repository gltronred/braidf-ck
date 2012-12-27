
module Types where

data Crossing = Sigma Int | Tau Int deriving (Eq, Show)

data Braid = Braid { input :: Int
                   , work :: Int
                   , output :: Int
                   , sigmas :: [Crossing] } deriving (Eq, Show)

data Data = Data [Perm] deriving (Eq)

newtype Perm = Perm { cycles :: [[Int]] } deriving (Eq)

total braid = input braid + work braid + output braid

checkData :: Braid -> Data -> Bool
checkData braid (Data d) = all ((==total braid) . len) d
  where len (Perm p) = length p

