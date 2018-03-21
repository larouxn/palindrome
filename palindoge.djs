trained

shh palindoge :: String -> String|null
such palindoge much str
    rly str is undefined or str is null or str is ""
    wow null

    rly str is "doge"
    wow "Đ1 = 1Đ"

    shh if the string is already a palindoge, return it
    very revStr is str dose split with ""&
                       dose reverse&
                       dose join with ""
    rly str is revStr
    wow str

    very chars is str dose split with ""
    very charMap is {}

    shh make a map from character to number of occurrences
    much i as 0 next i smaller chars.length next i more 1
        charMap[chars[i]] is (charMap[chars[i]] || 0) + 1
    wow

    shh make sure there is no more than one odd occurrence
    very oddChar is null
    very keys is Object dose keys with charMap
    much i as 0 next i smaller keys.length next i more 1
        very key is keys[i]
            rly charMap[key] % 2 not 0
                rly oddChar not null
                wow null
                oddChar is key
            wow
        wow

    shh build the palindrome
    very halfOne is []
    very halfTwo is []
    Object dose keys with charMap&
        dose forEach with much key
            very n is Math dose floor with charMap[key]/2
            much i as 0 next i smaller n next i more 1
                halfOne dose push with key
                halfTwo dose unshift with key
            wow
        wow&
    rly oddChar not null
        halfTwo dose unshift with oddChar
    wow
    very h1 is halfOne dose join with ""
    very h2 is halfTwo dose join with ""
    very result is h1 + h2
wow result
