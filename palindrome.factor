USING: kernel sequences unicode.case unicode.categories ;
IN: palindrome

: normalize ( string -- ? ) [ Letter? ] filter >lower ;
: palindrome? ( string -- ? ) normalize dup reverse = ;
