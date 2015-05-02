import Data.List
import Data.Map (toList, fromListWith)

makePalindrome :: String -> Maybe String
makePalindrome str | length oddChars > 1   = Nothing
                   | str == reverse str    = Just str
                   | length oddChars == 1  = Just $ halfPalindrome ++ [(fst . head) oddChars] ++ reverse halfPalindrome
                   | otherwise             = Just $ halfPalindrome ++ reverse halfPalindrome
     where 
        charList            = toList $ fromListWith (+) [ (c, 1) | c <- str ]
        oddChars            = filter ((/=) 0 . flip mod 2 . snd) charList
        charListOddsToEvens = map (\(ch, n) -> if mod n 2 /= 0 then (ch, n-1) else (ch, n)) charList
        halfPalindrome      = (concat . map (\(ch, n) -> replicate (n `div` 2) ch)) charListOddsToEvens
