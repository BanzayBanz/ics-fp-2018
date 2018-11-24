% ���� ����� ������ ���� father(person1, person2) (person1 is the father of person2)
% ���������� ���������� ����� ����������:
% 1. brother(X,Y)    -  ������������ �������� �� ��������� ��������
% 2. cousin(X,Y)     -  ������������ �������� �� ��������� ����������� ��������
% 3. grandson(X,Y)   -  ������������ �������� �� �������� � ������ ��������� Y
% 4. descendent(X,Y) -  ������������ �������� �� �������� X �������� ��������� Y
% 5. ��������� � �������� �������� ������ ��������� ���� ���������

	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5

	brother(X,Y) :- father(Z,X), father(Z,Y), not(X=Y).
	cousin(X,Y) :- father(Z,X), brother(Z,G), father(G,Y).
	grandson(X,Y) :- father(Z,X), father(Y,Z).
	descendent(X,Y) :- father(Y,X); father(Y,Z), descendent(X,Z).
 
	:- writeln('LIST OF ALL DETECTED BROTHERS:').
	:-forall(brother(X,Y), (write(X), write(' '), writeln(Y))).
	:- writeln('LIST OF ALL DETECTED COUSINES:').
	:-forall(cousin(X,Y), (write(X), write(' '), writeln(Y))).
	:- writeln('LIST OF ALL DETECTED GRANDSONS:').
	:-forall(grandson(X,Y), (write(X), write(' '), writeln(Y))).
	:- writeln('LIST OF ALL DETECTED DESCENDENTS:').
	:-forall(descendent(X,Y), (write(X), write(' '), writeln(Y))).

% Here is list of all detected result combinations:
%?- LIST OF ALL DETECTED BROTHERS:
%b c
%c b
%d e
%e d
%LIST OF ALL DETECTED COUSINES:
%d f
%e f
%f d
%f e
%LIST OF ALL DETECTED GRANDSONS:
%d a
%e a
%f a
%LIST OF ALL DETECTED DESCENDENTS:
%b a
%c a
%d b
%e b
%f c
%d a
%e a
%f a 