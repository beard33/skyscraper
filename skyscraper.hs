import System.IO(readFile, IOMode(ReadMode), hGetContents, hClose, openFile)
import Data.List (transpose)

-- Check if the provided list is a valid skyscraper list
-- (i.e. if values are unique and within the range)
isListValid :: [Int] -> Bool
isListValid list = allUnique' list && all (\x -> x <= length list && x > 0) list

allUnique' :: [Int] -> Bool
allUnique' [] = True
allUnique' (x:xs) = x `notElem` xs && allUnique' xs


-- Perform the rooftop count
rooftops :: [Int] -> Int -> Int -> Bool
rooftops [] highest count = count == 0
rooftops (x : xs) highest count
    | x > highest = rooftops xs x (count-1)
    | otherwise  = rooftops xs highest count

-- Check if the matrix is a valid solution
-- for the skyscraper problem
checkMatrix :: [[Int]] -> Bool
checkMatrix [] = True
checkMatrix ((0 : xs) : xss) = isListValid (init xs)
                        && checkMatrix xss
checkMatrix ((x : xs) : xss) = isListValid (init xs)
                        && rooftops (init xs) 0 x
                        && checkMatrix xss


-- Parse line into a list of Int
parseLine :: String -> [Int]
parseLine line = map read $ words line :: [Int]
main :: IO ()
main = do
    handle <- openFile "skyscrapers-3x3.txt" ReadMode
    contents <- hGetContents handle
    let allLines = lines contents
    let matrix = map parseLine allLines
    let inverseMatrix = map reverse matrix
    let matrix' = transpose matrix
    let inverseTMatrix = map reverse matrix
    let res = checkMatrix(tail (init matrix)) 
            && checkMatrix(tail (init matrix'))
            && checkMatrix(tail (init inverseMatrix))
            && checkMatrix(tail (init inverseTMatrix))
    if res then print "Solution is correct" else print "Solution is wrong"
    hClose handle

