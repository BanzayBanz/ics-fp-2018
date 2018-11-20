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

brother(X,Y) :- father(Z,X), father(Z,Y), X \= Y.

cousin(X,Y) :- brother(V,W), V \= W, father(V,X), father(W,Y), X \= Y.

grandson(X,Y) :- father(Z,X), father(Y,Z).

descendent(X,Y):- father(X,Y).
descendent(X,Y) :- father(X,Z), descendent(Z,Y).

