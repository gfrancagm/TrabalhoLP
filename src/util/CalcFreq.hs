module util.CalcFreq where

import System.IO
import Data.List (sortBy, nub)

retiraSeparadores :: String -> Char -> String
retiraSeparadores sep x
    | x `elem` sep = " "
    | otherwise = [x] 

contaPalavra lista palavra = length (filter (== palavra) lista)

sorteiaPorQuantidade (a1, b1) (a2, b2) 
    | b1 > b2 = LT
    | b1 < b2 = GT
    | b1 == b2 = compare a1 a2

adicionaPesos res (a, b) 
    | a `elem` res = (a, 2*b)
    | otherwise = (a, b)

main = do
    sep <- readFile "sep.txt"
    res <- readFile "res.txt"
    c1 <- readFile "c1.txt"
    c2 <- readFile "c2.txt"    

    let sepList = sep
    let resList = words res

    let program1 = words (programMinusSep c1 sepList)

    let quantityWords = map (countWord program1) program1

    let tuplesWordQtt = zip program1 quantityWords

    let sortedTuples = nub (sortBy sortByQtt tuplesWordQtt)

    let weightedTuples = map (addWeight resList) sortedTuples

    print weightedTuples

    return ()