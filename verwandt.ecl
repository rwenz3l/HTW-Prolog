r:- [verwandt].
maennlich(tom). % Tom ist Maennlich
maennlich(peter). % Peter ist Maennlich
weiblich(maria). % Maria ist weiblich
weiblich(lotte). % Lotte ist weiblich
kind(peter, tom). % Peter ist Kind von Tom.
kind(peter, maria). % Peter ist Kind von Maria
kind(lotte, tom). % Lotte ist kind von Tom
kind(lotte, maria). % Lotte ist kind von Maria

vater(X,Y) :- kind(Y,X), maennlich(X). % Ist X Vater von Y?
mutter(X,Y):- kind(Y,X), weiblich(X). % Ist X Mutter von Y?
sohn(X,Y) :- kind(X,Y), maennlich(X). % Ist X Sohn von Y?
tochter(X,Y) :- kind(X,Y), weiblich(X). % Ist X Tochter von Y?

