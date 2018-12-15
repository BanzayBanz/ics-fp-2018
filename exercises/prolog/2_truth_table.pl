 % ���������� ���������:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ����������� �������� truth_table(A,B, expression) ��� ���������� ������ ����������, ��������:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

	and(A,B) :- A, B.
	redefine_system_predicate(not(A)) :- \+A.
	or(A,B) :- A; B.
	xor(A,B) :- not(equ(A,B)).
	equ(A,B) :- A=B.

% ������� ���������� �������� ��� �������
	bool(X) :- X=true.
	bool(X) :- X=fail.

% ������� evaluation
	eval(E, true):- E, !. 
	eval(_, fail).

	truth_table(A, B, E):- bool(A),bool(B),
					write(A), write(' '), write(B), write(' '),
					eval(E, R), writeln(R), fail.
	truth_table(_,_,_):- nl, true.

	:- writeln("Truth table AND:").
	:- truth_table(A, B, and(A,B)).

	:- writeln("Truth table OR:").
	:- truth_table(A, B, or(A,B)).

	:- writeln("Truth table XOR:").
	:- truth_table(A, B, xor(A,B)).

	:- writeln("Truth table EQU:").
	:- truth_table(A, B, equ(A,B)).

