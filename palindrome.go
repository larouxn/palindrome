package main

import "fmt"

var word string = "racecar"

// Borrowed from Russ Cox | http://goo.gl/XrHvrk | slightly modified
func reverse(input string) string {
    // Get Unicode code points.
    n := 0
    rune := make([]rune, len(input))
    for _, r := range input {
        rune[n] = r
        n++
    }
    rune = rune[0:n]
    // Reverse
    for i := 0; i < n/2; i++ {
        rune[i], rune[n-1-i] = rune[n-1-i], rune[i]
    }
    // Convert back to UTF-8.
    output := string(rune)
    return output
}


func is_palindrome(x string) bool {
    if x == reverse(x) {
        return true
    } else {
        return false
    }
}

func main() {
    fmt.Printf("%s is a palindrome: %t\n", word, is_palindrome(word))
}
