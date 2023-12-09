female(diana).
female(catherine).
female(meghan).
female(charlotte).
female(lilibet).

male(charles).
male(william).
male(harry).
male(george).
male(louis).
male(archie).

married(charles, diana).
married(william, catherine).
married(harry, meghan).

parent(charles, william).
parent(diana, william).
parent(charles, harry).
parent(diana, harry).
parent(william, george).
parent(catherine, george).
parent(william, charlotte).
parent(catherine, charlotte).
parent(william, louis).
parent(catherine, louis).
parent(harry, archie).
parent(meghan, archie).
parent(harry, lilibet).
parent(meghan, lilibet).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

all_siblings(X, Siblings) :-
    findall(Y, sibling(X, Y), DuplicatedSiblings),
    list_to_set(DuplicatedSiblings, Siblings).

brother(X, Y) :- male(X), sibling(X, Y).

sister(X, Y) :- female(X), sibling(X, Y).

mother(X, Y) :- female(X), parent(X, Y).

father(X, Y) :- male(X), parent(X, Y).

mother_in_law(X, Y) :- mother(X, Z), married(Y, Z).

daughter_in_law(X, Y) :- female(X), married(X, Z), parent(Y, Z).

grandfather(X, Y) :- father(X, Z), father(Z, Y).

aunt(X, Y) :- sister(X, Z), parent(Z, Y).

uncle(X, Y) :- brother(X, Z), parent(Z, Y).

all_uncles(X, Uncles) :- findall(Uncle, uncle(Uncle, X), Uncles).
