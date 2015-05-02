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
  FirstHalf  = string:substr(InputString, 1, trunc(string:len(InputString) / 2)),
  SecondHalf = string:substr(InputString, trunc(string:len(InputString) / 2)),
  io:format("First half is ~s~n", [FirstHalf]),
  io:format("Second half is ~s~n", [SecondHalf]),
  true.

display(InputString) ->
  InputIsPalindrome = isPalindrome(InputString),
  % if
  %   InputIsPalindrome =:= true -> io:format("~s is a palindrome", [InputString]);
  %   true -> io:format("nope", []);
  % end.
  io:format("I am a palindrome~n").
