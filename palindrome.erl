-module(palindrome).
-export([isPalindrome/1]).
-export([display/1]).
-export([createPalindrome/1]).

isPalindrome(InputString) ->
  InputString =:= lists:reverse(InputString).

createPalindrome(InputString) ->
  io:format("dingo").

display(InputString) ->
  InputIsPalindrome = isPalindrome(InputString),
  if
    InputIsPalindrome =:= true -> io:format("~s is a palindrome!~n", [InputString]);
    true                       -> createPalindrome(InputString)
  end.
