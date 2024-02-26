-- Program Assignment 2: Haskell Quicksort Function
-- CS 3363 Spring 2024
-- Richard Churchill
-- Due: 2-17-2024
-- Sumitted: 2-17-2024
-- Jordan Paul, jopaul
-- hasqs: function accepts list of real values or characters
--		  and sorts in acsending order using recursion
-- 		  * keeps duplicates

-- usage with ghci-   :l hasqs.hs
--                    hasqs [5, 3, 1, 5, 2]
--			output:   [1, 2, 3, 4, 5]
--
--					  hasqs "febcad"
--			output:   "abcdef"

--                    main
--			output:   hasqs exampleInt
--					  hasqs exampleFloat
--					  hasqs exampleChars

-- compiler	           ghc hasqs.hs -o hasqs
-- usage command line: hasqs


-- Idea from Learn You a Haskell for Great Good 5.4 page 49
hasqs :: (Ord a) => [a] -> [a]
hasqs [] = []
hasqs [x] = [x]
hasqs (x:xs) = hasqs [l | l <- xs, l <= x] ++ [x] ++ hasqs [r | r <- xs, r > x]


main :: IO()
main = do
  putStrLn ""
    
  -- example list Ints
  let exampleInt = [5, 3, 4, 1, 2, 8, 9, 0, 3, 7, 6, 8]
  print("exampleInt = " ++ show exampleInt)
  print("hasqs exampleInt: " ++ show (hasqs exampleInt))
    
  putStrLn ""
    
  -- example list floats
  let exampleFloat = [1.2, 0.6, 0.3, 1.6, 2.3, 1.2, 0.8, 0.9, 0.3, 0.6]
  print("exampleFloat = " ++ show exampleFloat)
  print("hasqs exampleFloat: " ++ show (hasqs exampleFloat))
    
  putStrLn ""
    
  -- example list Chars (string)
  let exampleChars = "hello, World"
  print("exampleChars = " ++ exampleChars)
  print("hasqs exampleChars: " ++ hasqs exampleChars)
  
  putStrLn ""
