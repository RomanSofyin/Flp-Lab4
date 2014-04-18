domains
	charList = char*
	
	
predicates
	run
	strToList(string,charList)
	excludeDigitsChar(charList,charList)
	readListWithoutDigits(char,charList)
	intersectionOfLists(charList,charList,charList)
	sortList(charList,charList)
	sortListX(char,charList,charList)
	order(char,char)
	isDigit(char)
	isElementOfList(char,charList)
clauses
	run :-
		write("������� ��� ������:\n"),
		write("1 -> "),readln(Str1),strToList(Str1,CharList1),
		excludeDigitsChar(CharList1,List1),
		write("2 -> "),readln(Str2),strToList(Str1,CharList2),
		excludeDigitsChar(CharList2,List2),
		readListWithoutDigits('y',List3),
		intersectionOfLists(List1,List2,List12),
		intersectionOfLists(List3,List12,List),
		sortList(List,SortedList).
	
	% ������������ ������ � ������ ��������
	strToList("",[]).
	strToList(Str,[H|T]) :-
		frontstr(1,Str,StrH,StrRest),
		str_char(StrH,H),
		strToList(StrRest,T).
	
	% ��������� �� ������ �������-�����
	excludeDigitsChar([],[]).
	excludeDigitsChar([H1|T1],[H1|T2]) :-
		not(isDigit(H1)),
		excludeDigitsChar(T1,T2).
	excludeDigitsChar([H1|T1],List) :-
		excludeDigitsChar(T1,List).
	
	% ������ ������ ��� ��������-����
	readListWithoutDigits('n',[]).
	readListWithoutDigits(_,[H|T]) :-
		write("������� ������� ������: "),
		readchar(H),
		not(isDigit(H)),
		write("���������� ����? (_/n)"),
		readchar(R),
		readListWithoutDigits(R,T).
	readListWithoutDigits(_,List) :-
		write("��������, �������-����� ������� ������."),nl,
		readListWithoutDigits(_,List).
	
	% List3 = ������������ ��������� ������������� List1 � List2
	intersectionOfLists([], _, []).
	intersectionOfLists(_, [], []).
	intersectionOfLists([H1|T1], List2, [H1|T3]) :-
		isElementOfList(H1,List2),
		intersectionOfLists(T1, List2, T3).
	intersectionOfLists([H1|T1], List2, List) :-
		intersectionOfLists(T1, List2, List).
	
	% ���������� ������ ������� �������
	sortList([],[]).
	sortList([X|Rest],Out) :-
		sortList(Rest,SortRest),
		sortListX(X,SortRest,Out).
		
	sortListX(X,[A|Rest],[A|Out]) :-
		order(A,X),!,
		sortListX(X,Rest,Out).
	sortListX(X,Rest,[X|Rest]).
	
	order(X,Y) :-
		X <= Y.
		
	% �������� �� ������ Char ��������-������
	isDigit(Char) :-
		char_int(Char,Int),
		Int >= 48,
		Int <= 57.
		
	% �������� �� �������������� ������
	isElementOfList(Char,[Char|_]).
	isElementOfList(Char,[_|Tail]) :-
		isElementOfList(Char,Tail).
goal
	run.