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

# def can_be_palindrome(freq):
#     return

def main(string):
    freq  = count_letters(string)
    if is_palindrome(string)
        print "#{string} is already a palindrome."
    # elif !can_be_palindrome(string)
    #     print "#{string} cannot be made into a palindrome."
    # else
    #     print "Palindrome of #{string}: #{Palindrome.create(freq)}"
