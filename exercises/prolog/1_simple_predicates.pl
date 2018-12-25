% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями

        brother(X, Y) :- father(Z, X), father(Z, Y), X \= Y.

% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями

        cousin(X, Y) :- father(A, X), father(B, Y), brother(A, B), X \= Y.

% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y

        grandson(X, Y) :- father(Y, Z), father(Z, X).

% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y

        descendent(X, Y) :- father(Y, X).
        descendent(X, Y) :- father(Y, Z), descendent(X, Z).

% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
	
%	a
%	- b
%	-- d
%	-- e
%	- c
%	-- f
		
% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).
	
%	?- brother(X, Y).
%	X = b,
%	Y = c ;
%	X = c,
%	Y = b ;
%	X = d,
%	Y = e ;
%	X = e,
%	Y = d ;
%	false.

%	?- cousin(X, Y).
%	X = d,
%	Y = f ;
%	X = e,
%	Y = f ;
%	X = f,
%	Y = d ;
%	X = f,
%	Y = e ;
%	false.

%	?- grandson(X, Y).
%	X = d,
%	Y = a ;
%	X = e,
%	Y = a ;
%	X = f,
%	Y = a ;
%	false.

%	?- descendent(X, Y).
%	X = b,
%	Y = a ;
%	X = c,
%	Y = a ;
%	X = d,
%	Y = b ;
%	X = e,
%	Y = b ;
%	X = f,
%	Y = c ;
%	X = d,
%	Y = a ;
%	X = e,
%	Y = a ;
%	X = f,
%	Y = a ;
%	false.
