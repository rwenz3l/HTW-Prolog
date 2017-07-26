r:- [regen_ops].

/* Fakten: */
:-make(regen(berlin)).

/* Regeln: */
:-build(r1, if,(regen(X),then,make(nass(X))).

/* Frage: */
:-build(frage,if,nass(X),then,(write(X),write('ist nass'),nl,halt)).

