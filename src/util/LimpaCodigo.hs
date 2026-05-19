module util (LimpaCodigo) where

LimpaCodigo :: [String] -> [String] -> [String]
LimpaCodigo lista sep = filter (\x -> not (x `elem` sep)) lista