palindrome(X):- rev(X,Y), X == Y.
rev(L,R):- accRev(L,[],R).
accRev([H|T],A,R):- accRev(T,[H|A],R).
accRev([],A,A).
