import List
import String
import Dict

makePalindrome : String -> Maybe String
makePalindrome str = let
    charList             = charCount str
    oddChars             = List.filter (snd >> flip (%) 2 >> (==) 0 >> not) charList
    charListOddsToEven   = List.map (\(ch, n) -> if n % 2 == 0 then (ch, n) else (ch, n-1)) charList
    halfPalindrome       = List.map (\(ch, n) -> String.repeat (n//2) ch) charListOddsToEven |> String.concat
    in 
        if List.length oddChars > 1       then Nothing
        else if str == String.reverse str then Just str
        else case List.head oddChars of
                Just (ch, _) -> Just <| halfPalindrome ++ ch ++ String.reverse halfPalindrome
                Nothing      -> Just <| halfPalindrome ++ String.reverse halfPalindrome

charCount : String -> List (String, Int)
charCount str = String.toList str   
                |> List.foldl (\elem dict -> if Dict.member elem dict 
                                        then Dict.update elem (\(Just n) -> Just (n+1)) dict
                                        else Dict.insert elem 1 dict) Dict.empty
                |> Dict.toList |> List.map (\(ch, n) -> (String.fromChar ch, n))
