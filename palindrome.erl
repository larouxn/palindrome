%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% John Paul Welsh                    %%
%% May 2015                           %%
%% Check if a string is a palindrome  %%
%% if not, can it be, if so make a    %%
%% palindrome of it.                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(palindrome).
-export([isPalindrome/1]).
-export([display/1]).
-export([perms/1]).

% Taken from http://www.erlang.org/doc/programming_examples/list_comprehensions.html
perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

isPalindrome(InputString) ->
  StrLen = string:len(InputString),
  FirstHalf = if
    StrLen =:= 1 -> InputString;
    true         -> string:sub_string(InputString, 1, StrLen div 2)
  end,
  SecondHalf = lists:reverse(if
    StrLen         =:= 1 -> InputString;
    (StrLen rem 2) =:= 0 -> string:sub_string(InputString, StrLen div 2 + 1, StrLen);
    true                 -> string:sub_string(InputString, StrLen div 2 + 2, StrLen)
  end),
  FirstHalf =:= SecondHalf.

display(InputString) ->
  InputIsPalindrome = isPalindrome(InputString),
  if
    InputIsPalindrome =:= true -> io:format("~s is a palindrome!~n", [InputString]);
    true                       -> io:format("nope~n", [])
  end.
