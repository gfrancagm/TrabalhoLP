module Main where

import System.IO
import Util.Util

main :: IO ()
main = do
    conteudoRes <- readFile "../files/res.txt"
    conteudoSep <- readFile "../files/sep.txt"

    conteudoC1 <- readFile "../files/c1.txt"
    conteudoC2 <- readFile "../files/c2.txt"

    let res = words conteudoRes
    let sep = conteudoSep

    let c1 = words (concatMap (retiraSeps sep) conteudoC1)
    let c2 = words (concatMap (retiraSeps sep) conteudoC2)

    let c1Tuplas = fazTuplas c1 res
    let c2Tuplas = fazTuplas c2 res

    let m = contaM c1Tuplas c2Tuplas

    let somaF1 = calculaF c1Tuplas
    let somaF2 = calculaF c2Tuplas

    let sim1 = calculaSimilaridade m somaF1
    let sim2 = calculaSimilaridade m somaF2

    print sim1
    print sim2