domains
	charList = char*
	
	
predicates
	run
	strToList(string,charList)
	excludeCharDigits(charList,charList)
	readListWithoutDigits(char,charList)
	intersectionOfLists(charList,charList,charList)
	sortList(charList,charList)
	append(charList,charList,charList)
	reverse(charList,charList)
	isDigit(char)
clauses
	run :-
		write("������� ��� ������:\n"),
		write("1 -> "),readln(Str1),strToList(Str1,CharList1),
		excludeCharDigits(CharList1,List1),
		write("2 -> "),readln(Str2),strToList(Str1,CharList2),
		excludeCharDigits(CharList2,List2),
		readListWithoutDigits('y',List3),
		intersectionOfLists(List1,List2,List12),
		intersectionOfLists(List3,List12,List)
		sortList(List,SortedList).
		
	strToList
	
	excludeCharDigits
	
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
	
	intersectionOfLists
	
	sortList
	
	append([],List,List).
	append([H|List1],List2,[H|List3]) :-
		append(List1,List2,List3).
	
	reverse([],[]).
	reverse([H,Tail], ReverseList) :-
		reverse(Tail,ReverseTail), append(ReverseTail, [H], ReverseList).
	
	isDigit(Char) :-
		char_int(Char,Int),
		Int >= 48,
		Int <= 57.
goal
	run.