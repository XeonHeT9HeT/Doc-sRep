man(father).
man(first_son).
man(second_son).
man(grandpa).
man(billy).
woman(mother).
woman(sister).
woman(grandma).
woman(aunt).
married(father, mother).
married(grandma, grandpa).
parent(aunt, grandpa).
parent(father, grandpa).
parent(father, grandma).
parent(first_son,father).
parent(second_son,father).
parent(sister,father).

isbrother(X,Y):-parent(X,father),parent(Y,father).

issister(sister,X):-parent(sister,father),parent(X,father).

isrelatives(X,Y):- (parent(X,Y); isbrother(X,Y); issister(X,Y); married(X,Y)) -> write('Yes').

istree(X):-(parent(X,grandpa) ->true) -> (write('grandpa and grandma -> '), write(X), ((married(X,mother) -> true) -> write(' and mother -> First son, Second son, Daughter'));write(' | End of family tree')) ; write('Not a family tree'), exit().

isaunt(X,Y):- (parent(Y,father), parent(X,grandpa));(parent(X,father), parent(Y,grandpa)).