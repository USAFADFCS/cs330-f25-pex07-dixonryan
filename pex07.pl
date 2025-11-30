% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Dixon Ryan
%
% Documentation: Used HW07 code -> most of inspiration
%


C4C(Chen).
C4C(Garcia).
C4C(Smith).
C4C(Jones).

Sighting(WeatherBalloon).
Sighting(Kite).
Sighting(Fighter).
Sighting(Cloud).

Day(Tuesday).
Day(Wednesday).
Day(Thursday).
Day(Friday).

solve :-
    Sighting(ChenSighting), Sighting(GarciaSighting), Sighting(SmithSighting), Sighting(JonesSighting),
    all_different([ChenSighting, GarciaSighting, SmithSighting, JonesSighting]),

    Day(ChenDay), Day(GarciaDay), Day(SmithDay), Day(JonesDay),
    all_different([ChenDay, GarciaDay, SmithDay, JonesDay]),

    Triples = [[Chen, ChenSighting, ChenDay],
               [Garcia, GarciaSighting, GarciaDay],
               [Smith, SmithSighting, SmithDay],
               [Jones, JonesSighting, JonesDay]],

    % 1. Smith did not see weather balloon or kite
    \+ member([Smith, WeatherBalloon, _], Triples),
    \+ member([Smith, Kite, _], Triples),

    % 2. C4C Garcia didnt see the kite
    \+ member([Garcia, Kite, _], Triples),

    % 3. Friday sighting by Chen or fighter viewer
    (member([Chen, _, Friday], Triples); member([_,Fighter,Friday], Triples)),

    % 4. Kite not sighted on a Tuesday
    \+ member([_, Kite, Tuesday], Triples),

    % 5. Jones and Garcia didnt see balloon
    \+ member([Jones, WeatherBalloon, _], Triples),
    \+ member([Garcia, WeatherBalloon, _], Triples),

    % 6. Jones sighting not on Tuesday
    \+ member([Jones, _, Tuesday], Triples),

    % 7. Smith saw Cloud
    member([Smith, Cloud, _], Triples),

    % 8. Fighter aircraft spotted Friday
    member([_, Fighter, Friday], Triples),

    % 9. Balloon not spotted Wednesday
    \+ member([_, WeatherBalloon, Wednesday], Triples).



all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).


tell(X, Y, Z) :-
    write('Cadet '), write(X), write(' on '), write(Y),
    write(' saw a '), write(Z), write('.'), nl.


% The query to get the answer(s) or that there is no answer
% ?- solve.


