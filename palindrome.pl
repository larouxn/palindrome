:- dynamic letterFreq/2
palindrome(X):- accRev(X,[],Y), X == Y.
palindrome(X):- findall(Z,letterFreq(_,Z),List), modCount(List, 0, Count), Count < 2, newPalindrome(List, [], NewDrome), write(NewDrome).
accRev([H|T],A,R):- accRev(T,[H|A],R), letterFreq(H,X), Y is X + 1, assert(letterFreq(H,Y)).
accRev([H|T],A,R):- accRev(T,[H|A],R), assert(letterFreq(H,0)).
accRev([],A,A).
modCount([H|T],A,R):- 1 is mod(H,2), B is A + 1, modCount(T,B,R).
modCount([H|T],A,R):- modCount(T,A,R).
modCount([],A,A).
newPalindrome([H|T],A,R):- %to do
