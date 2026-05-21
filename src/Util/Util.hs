module Util.Util where

limpaCodigo :: [String] -> [String] -> [String]
limpaCodigo lista sep = filter (\x -> not (x `elem` sep)) lista

dentroLimite :: Int -> Int -> Bool
dentroLimite f1 f2 =
    let dif = abs (f1 - f2)
        lim = fromIntegral f1 * 0.1
    in fromIntegral dif <= lim

validaFrequencia :: (String, Int) -> [(String, Int)] -> Int
validaFrequencia _ [] = 0
validaFrequencia (p1, f1) ((p2, f2) : xs)
    | p1 == p2 && dentroLimite f1 f2 = f1
    | p1 == p2 = 0
    | otherwise = validaFrequencia (p1, f1) xs

contaM :: [(String, Int)] -> [(String, Int)] -> Int
contaM [] _ = 0
contaM (x:xs) c2 = validaFrequencia x c2 + contaM xs c2

calculaF1 :: [(String, Int)] -> Int
calculaF1 c1 = sum (map snd c1)

calculaSimilaridade :: Int -> Int -> Float
calculaSimilaridade m f1
    | f1 == 0 = 0.0
    | otherwise = fromIntegral m / fromIntegral f1