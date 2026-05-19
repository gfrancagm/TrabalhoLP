import System.IO
import util.LimpaCodigo

main :: IO ()
main = do
    conteudoRes <- readFile "../files/res.txt"
    conteudoSep <- readFile "../files/sep.txt"

    conteudoC1 <- readFile "../files/c1.txt"
    conteudoC2 <- readFile "../files/c2.txt"

    let res = words conteudoRes
    let sep = words conteudoSep

    let c1 = LimpaCodigo (words conteudoC1) sep
    let c2 = LimpaCodigo (words conteudoC2) sep

    