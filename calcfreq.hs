-- O programa deve computar, em c1 e c2, a frequencia fi (1 <= i <= 2) de cada palavra 
-- que não esteja incluída em sep.
-- Palavras contidas em res devem ter o dobro de peso que as demais palavras.
import System.IO

getListFromFile :: FilePath -> IO [String]
getListFromFile path = do
    handle <- openFile path ReadMode
    contents <- hGetContents handle
    let list = words contents

    return list

main = do
    separators <- getListFromFile "sep.txt"
    reserved <- getListFromFile "res.txt"
    program1 <- getListFromFile "c1.txt"
    program2 <- getListFromFile "c2.txt"

    -- TODO : Função que vai pegar todas as Strings das listas de programas e retirar os separadores delas
    -- TODO : Função para calcular a quantidade de palavras em cada programa
    -- TODO : Função para calcular a quantidade de cada palavra de cada programa

    return ()