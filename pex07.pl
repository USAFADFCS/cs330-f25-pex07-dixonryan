% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Dixon Ryan
%
% Documentation: Used HW07 code -> most of inspiration;
$                Chat had to help me install proLog again (IT WROTE NO CODE FOR ME)
%


c4C(chen).
c4C(garcia).
c4C(smith).
c4C(jones).

sighting(weatherBalloon).
sighting(kite).
sighting(fighter).
sighting(cloud).

day(tuesday).
day(wednesday).
day(thursday).
day(friday).

solve :-
    sighting(ChenSighting), sighting(GarciaSighting), sighting(SmithSighting), sighting(JonesSighting),
    all_different([ChenSighting, GarciaSighting, SmithSighting, JonesSighting]),

    day(ChenDay), day(GarciaDay), day(SmithDay), day(JonesDay),
    all_different([ChenDay, GarciaDay, SmithDay, JonesDay]),

    Triples = [[chen, ChenSighting, ChenDay],
               [garcia, GarciaSighting, GarciaDay],
               [smith, SmithSighting, SmithDay],
               [jones, JonesSighting, JonesDay]],

    % 1. Smith did not see weather balloon or kite
    \+ member([smith, weatherBalloon, _], Triples),
    \+ member([smith, kite, _], Triples),

    % 2. C4C Garcia didnt see the kite
    \+ member([garcia, kite, _], Triples),

    % 3. Friday sighting by Chen or fighter viewer
    (member([chen, _, friday], Triples); member([_,fighter,friday], Triples)),

    % 4. Kite not sighted on a Tuesday
    \+ member([_, kite, tuesday], Triples),

    % 5. Jones and Garcia didnt see balloon
    \+ member([jones, weatherBalloon, _], Triples),
    \+ member([garcia, weatherBalloon, _], Triples),

    % 6. Jones sighting not on Tuesday
    \+ member([jones, _, tuesday], Triples),

    % 7. Smith saw Cloud
    member([smith, cloud, _], Triples),

    % 8. Fighter aircraft spotted Friday
    member([_, fighter, friday], Triples),

    % 9. Balloon not spotted Wednesday
    \+ member([_, weatherBalloon, wednesday], Triples),

    member([TueName, TueSight, tuesday], Triples),
    tell(TueName, tuesday, TueSight),
    
    member([WedName, WedSight, wednesday], Triples),
    tell(WedName, wednesday, WedSight),

    member([ThurName, ThurSight, thursday], Triples),
    tell(ThurName, thursday, ThurSight),

    member([FriName, FriSight, friday], Triples),
    tell(FriName, friday, FriSight).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).


tell(X, Y, Z) :-
    write('Cadet '), write(X), write(' on '), write(Z),
    write(' saw a '), write(Y), write('.'), nl.


% The query to get the answer(s) or that there is no answer
% ?- solve.


