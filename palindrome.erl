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

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

isPalindrome(InputString) ->
  FirstHalf = substr(InputString, len(InputString)/2).
  SecondHalf = substr(InputString, len(InputString)/2, (len(InputString)/2)-1).
  true.

display(InputString) ->
  % InputIsPalindrome = isPalindrome(InputString).
  % if
  %   InputIsPalindrome =:= true -> io:format("~s is a palindrome", [InputString]);
  %   true -> io:format("nope", []);
  % end.
  io:format("I am a palindrome").
