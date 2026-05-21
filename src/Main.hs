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