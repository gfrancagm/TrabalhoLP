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

removeSeparators :: String -> String -> String
removeSeparators separators word = [character | character <- word, character `notElem` separators]

countWord:: String  -> [String] -> Int
countWord word program = length (filter (== word) program) 

totalQuantity:: [String] -> Int
totalQuantity program = length(program)

makeTupleWordQuantity :: [String] -> String -> (String, Int)
makeTupleWordQuantity program word = (word, quantity)
    where
        quantity = countWord word program



main = do
    separators <- readFile "sep.txt"
    reserved <- getListFromFile "res.txt"
    program1 <- getListFromFile "c1.txt"
    program2 <- getListFromFile "c2.txt"    


    let list_tuples = map (makeTupleWordQuantity program1) program1 

    return ()