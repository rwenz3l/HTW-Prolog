r:- [semantic].

ist_ein(backware,nachrungsmittel).
ist_ein(zimtgebaeck,backware).
ist_ein(haselnuesse, frucht).
ist_ein(frucht, nahrungsmittel).
ist_ein(X,Z) :- ist_ein(X,Y), ist_ein(Y,Z).

hat_Teil(zimtgebaeck,eier).
hat_Teil(zimtgebaeck,haselnuesse).
hat_Teil(zimtgebaeck,zimtpulver).
hat_Teil(zimtgebaeck,mehl).
hat_Teil(zimtgebaeck,zucker).
hat_Teil(zimtgebaeck,butter).
% hat_Teil(X,Y) :- hat_Teil(X, Z), ist_ein(Z,Y).

hat_Menge(butter,gramm,150).
hat_Menge(eier,stueck,2).
hat_Menge(mehl,gramm,140).
hat_Menge(zucker,gramm,170).
hat_Menge(haselnuesse,gramm,150).
hat_Menge(zimtpulver,essloeffel,1).

enthalten(X,Y,Gramm) :- hat_Teil(X,Y), hat_Menge(Y,gramm,Gramm).
enthalten(X,Y,0) :- hat_Teil(X,Y), not hat_Menge(Y,gramm,Gramm).
enthalten(X,Y,Gr) :- hat_Teil(X,Y), hat_Menge(Y,W,_), not(W=gramm), einwaage(Y,gramm,Gr).

einwaage(zimtpulver, gramm, Gr) :- hat_Menge(zimtpulver,essloeffel,Anz), Gr is 10*Anz.
einwaage(eier,gramm,Gramm) :- hat_Menge(eier,stueck,Stueck), Gramm is 30*Stueck.
gewicht(X,Gew) :- findall(Gramm, enthalten(X,_,Gramm),GrammList), Gew is sum(GrammList).

