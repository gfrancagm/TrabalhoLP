module Util.Util where

import System.IO
import Data.List (sortBy, nub)

retiraSeps :: String -> Char -> String
retiraSeps sep x
    | x `elem` sep = " "
    | otherwise = [x] 

contaPalavra :: Eq a => [a] -> a -> Int
contaPalavra lista palavra = length (filter (== palavra) lista)

sorteiaPorQtd :: (Ord a1, Ord a2) => (a2, a1) -> (a2, a1) -> Ordering
sorteiaPorQtd (a1, b1) (a2, b2) 
    | b1 > b2 = LT
    | b1 < b2 = GT
    | b1 == b2 = compare a1 a2

adicionaPesos :: (Foldable t, Eq a, Num b) => t a -> (a, b) -> (a, b)
adicionaPesos res (a, b) 
    | a `elem` res = (a, 2*b)
    | otherwise = (a, b)

fazTuplas :: (Ord a, Foldable t) => [a] -> t a -> [(a, Int)]
fazTuplas c res  = 
    let qtdPalavras = map (contaPalavra c) c 
        listaTuplas = zip c qtdPalavras
        tuplasSemDuplicados = nub (sortBy sorteiaPorQtd listaTuplas) 
        tuplascPeso = map (adicionaPesos res) tuplasSemDuplicados 

    in tuplascPeso   

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