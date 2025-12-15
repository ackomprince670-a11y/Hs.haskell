greaterThan18 :: (Ord a, Num a) => a -> Bool
greaterThan18 x = x > 18

main :: IO ()
main = do
    print (greaterThan18 20)   -- True
    print (greaterThan18 10)   -- False
    print (greaterThan18 18)   -- False

----------------------------------------
Composing a Function to Process Player Data
--------------------------------------------
 extractPlayers: Extracts player names from a list of (name, score)
extractPlayers :: [(String, Int)] -> [String]
extractPlayers players = [name | (name, _) <- players]

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore players = sortBy (flip (comparing snd)) players

topThree :: [(String, Int)] -> [(String, Int)]
topThree players = take 3 players

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore


-- Example usage
main :: IO ()
main = do
    let players =
            [ ("Alice", 50)
            , ("Bob", 75)
            , ("Charlie", 60)
            , ("Diana", 90)
            , ("Evan", 40)
            ]

    print (getTopThreePlayers players)
    -- Output: ["Diana","Bob","Charlie"]
----------------------------------------------
Task 5: Laziness in Haskell
-----------------------------------------------
infiniteNumbers :: [Int]
infiniteNumbers = [1..]

firstN :: Int -> [Int]
firstN n = take n infiniteNumbers

main :: IO ()
main = do
    print (firstN 5)   -- Output: [1,2,3,4,5]
    print (firstN 10)  -- Output: [1,2,3,4,5,6,7,8,9,10]
------------------------------------------------------------
Task 6: Using Type Signatures
-----------------------------------------------------------
addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

main :: IO ()
main = doTask 7: 
    print (addNumbers 5 7)   -- Output: 12
    print (addNumbers 10 15) -- Output: 25
--------------------------------------------
Task 7: Converting Fahrenheit to Celsius
--------------------------------------------
fToC :: Floating a => a -> a
fToC f = (f - 32) * 5 / 9

main :: IO ()
main = do
    print (fToC 32)    -- Output: 0.0
    print (fToC 98.6)  -- Output: 37.0
    print (fToC 212)   -- Output: 100.0
------------------------------------------
Task 8: Higher-Order Functions
-----------------------------------------
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main :: IO ()
main = do
    print (applyTwice (+2) 5)     -- Output: 9   (5 + 2 + 2)
    print (applyTwice (*3) 2)     -- Output: 18  (2 * 3 * 3)
    print (applyTwice reverse [1,2,3]) -- Output: [1,2,3]
the end
