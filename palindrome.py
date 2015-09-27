def count_letters(string):
    freq, limit, i = {}, len(string), 0
    while i < limit:
        if string[i] in freq:
            freq[string[i]] += 1
        else:
            freq[string[i]] = 1
        i += 1
    return freq

def is_palindrome(string):
    return True if string == string[::-1] else False

def can_be_palindrome(freq):
    numberOfOdds = 0
    for num in freq.values():
        if num % 2 != 0:
            numberOfOdds += 1
    if numberOfOdds > 1:
        return False
    else:
        return True

def create_palindrome(freq):
    palindrome = ""
    for (let, num) in freq.items():
        if num % 2 != 0:
            palindrome += let
            freq[let] -= 1
    for (let, num) in freq.items():
        palindrome = (let * (int(round(num / 2)))) + palindrome + (let * (int(round(num / 2))))
    return palindrome

def main(string):
    freq = count_letters(string)
    if is_palindrome(string):
        print ("{} is already a palindrome.".format(string))
    elif not can_be_palindrome(freq):
        print ("{} cannot be made into a palindrome.".format(string))
    else:
        palindrome = create_palindrome(freq)
        print ("Palindrome of {}: {}".format(string, palindrome))
