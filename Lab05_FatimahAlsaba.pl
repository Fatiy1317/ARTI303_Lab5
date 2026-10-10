% ARTI 303 - Lab 5: Working with Rules
% Family tree shown in the lab (The Simpsons).
% Facts: male/1, female/1, parent/2. Relations below are rules.

% Gender facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% Rules
father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

son(X, Y) :-
    parent(Y, X),
    male(X).

daughter(X, Y) :-
    parent(Y, X),
    female(X).

brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    dif(X, Y).

sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    dif(X, Y).

grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    brother(PX, PY).
cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    sister(PX, PY).

ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% TEST QUERIES AND EXPECTED ANSWERS
% Run each query at the SWI-Prolog prompt after consulting this file.
%
% 1. father/2
% ?- father(homer, bart).
% true.
% ?- father(abraham, homer).
% true.
%
% 2. mother/2
% ?- mother(marge, lisa).
% true.
% ?- mother(mona, homer).
% true.
%
% 3. son/2
% ?- son(bart, homer).
% true.
% ?- son(homer, mona).
% true.
%
% 4. daughter/2
% ?- daughter(lisa, marge).
% true.
% ?- daughter(maggie, homer).
% true.
%
% 5. brother/2
% ?- brother(bart, lisa).
% true.
% ?- brother(herb, homer).
% true.
%
% 6. sister/2
% ?- sister(lisa, bart).
% true.
% ?- sister(marge, patty).
% true.
%
% 7. grandfather/2
% ?- grandfather(abraham, bart).
% true.
% ?- grandfather(clancy, lisa).
% true.
%
% 8. aunt/2
% ?- aunt(patty, bart).
% true.
% ?- aunt(selma, lisa).
% true.
%
% 9. uncle/2
% ?- uncle(herb, bart).
% true.
% ?- uncle(herb, lisa).
% true.
%
% 10. cousin/2
% ?- cousin(bart, ling).
% true.
% ?- cousin(lisa, ling).
% true.
%
% 11. ancestor/2
% ?- ancestor(abraham, bart).
% true.
% ?- ancestor(clancy, maggie).
% true.
