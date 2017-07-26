r:- [einaus].
% Wir definieren Zustand als Dynamic,
% damit dieser während der Laufzeit von Prolog geändert werden kann.
:- dynamic zustand/1.
zustand(ein). % wir setzen initial auf "ein"
einaus(S) :- retract(zustand(ein)),S=aus, asserta(zustand(S)),!.
% ! bedeutet: Wenn der Wechsel auf 'aus' erfolgreich war, wird das Programm beendet.
einaus(S) :- retract(zustand(aus)),S=ein, asserta(zustand(S)).
