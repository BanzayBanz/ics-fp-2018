% ���������� �������� qsort(L, K) ������� ��� ��������� ������ ����� ����� ���������� ��������������� 

qsort([],[]).
qsort([Head|Tail],Sorted) :-

	% ��� ����� ��������� ������ �� 2 �����, ��������� "pivot"
	partition(Head,Tail,Little,Big),

	% ����� �� ���������� qsort () ��� ����� �������, ������� ����� �������� ������ ��� pivot
	qsort(Little,SortedLittle),

	% � ��� ������ �������, ��� �������� ������, ��� pivot
	qsort(Big,SortedBig),

	% �� ���������� append, ����� ������� ��������������� ����� ������
	append(SortedLittle,[Head|SortedBig],Sorted).

partition(_,[],[],[]).
% ����� �� ����������� � ���������� ��� �������� � pivot
partition(Pivot,[Head|Tail], [Head|Little], Big) :-	
Head =< Pivot, partition(Pivot,Tail,Little,Big).
partition(Pivot,[Head|Tail], Little, [Head|Big]) :-
	% if element greater than pivot we put it into the less part
	partition(Pivot,Tail,Little,Big).

%?- qsort([8,2,1,-2,-19,10,101,-20],Sorted).
%Sorted = [-20, -19, -2, 1, 2, 8, 10, 101] 
