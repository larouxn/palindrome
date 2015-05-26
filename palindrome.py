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
    for number in freq.values():
        if number % 2 != 0:
            numberOfOdds += 1
    if numberOfOdds > 1:
        return False
    else:
        return True

def main(string):
    freq  = count_letters(string)
    if is_palindrome(string):
        print ("{} is already a palindrome.".format(string))
    elif not can_be_palindrome(freq):
        print ("{} cannot be made into a palindrome.".format(string))
    # else
    #     print "Palindrome of #{string}: #{Palindrome.create(freq)}"
