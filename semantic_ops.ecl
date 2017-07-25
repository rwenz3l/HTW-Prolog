r:- [semantic_ops].

% Hier sind die Fakten
:- make(ist_ein(backware,nachrungsmittel)).
:- make(ist_ein(zimtgebaeck,backware)).
:- make(ist_ein(haselnuesse, frucht)).
:- make(ist_ein(frucht, nahrungsmittel)).

:- make(hat_Teil(zimtgebaeck,eier)).
:- make(hat_Teil(zimtgebaeck,haselnuesse)).
:- make(hat_Teil(zimtgebaeck,zimtpulver)).
:- make(hat_Teil(zimtgebaeck,mehl)).
:- make(hat_Teil(zimtgebaeck,zucker)).
:- make(hat_Teil(zimtgebaeck,butter)).

:- make(hat_Menge(butter,gramm,150)).
:- make(hat_Menge(eier,stueck,2)).
:- make(hat_Menge(mehl,gramm,140)).
:- make(hat_Menge(zucker,gramm,170)).
:- make(hat_Menge(haselnuesse,gramm,150)).
:- make(hat_Menge(zimtpulver,essloeffel,1)).

% Hier sind die Regeln
% Alternativ: :- build(rNo,(Regel --> Fakt)).
:- build(r1,if(ist_ein(X,Z), ist_ein(X,Y)),then,make(ist_ein(Y,Z))).
:- build(r2,if(hat_Teil(X,Y), hat_Menge(Y,gramm,Gramm)),then,make(enthalten(X,Y,Gramm))
:- build(r3,if(hat_Teil(X,Y), not hat_Menge(Y,gramm,Gramm)),then,make(enthalten(X,Y,0))).
:- build(r4,if(hat_Teil(X,Y), hat_Menge(Y,W,_), not(W=gramm), einwaage(Y,gramm,Gr).),then,make(enthalten(X,Y,Gr))).
:- build(r5,if(hat_Menge(zimtpulver,essloeffel,Anz), Gr is 10*Anz),then,make(einwaage(zimtpulver, gramm, Gr))).
:- build(r6,if(hat_Menge(eier,stueck,Stueck), Gramm is 30*Stueck),then,make(einwaage(eier,gramm,Gramm))).
:- build(frage,if(findall(Gramm, enthalten(X,_,Gramm),GrammList),Gew is sum(GrammList)),then,(gewicht(X,Gew),n1,halt)).

