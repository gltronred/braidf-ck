
module Types where

data Braid = Braid { input :: Int
                   , work :: Int
                   , output :: Int
                   , sigmas :: [(Int, Bool)] } deriving (Eq, Show)

data Data = Data [Perm] deriving (Eq, Show)

newtype Perm = Perm [Int] deriving (Eq, Show)

total braid = input braid + work braid + output braid

checkData :: Braid -> Data -> Bool
checkData braid (Data d) = all ((==total braid) . len) d
  where len (Perm p) = length p

