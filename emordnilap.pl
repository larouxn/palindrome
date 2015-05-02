palindrome(X):- accRev(X,[],Y), X == Y.
accRev([H|T],A,R):- accRev(T,[H|A],R).
accRev([],A,A).
