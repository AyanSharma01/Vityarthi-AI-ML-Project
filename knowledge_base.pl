% ==========================================================
% KNOWLEDGE BASE: UNIVERSITY CAMPUS ROUTE NETWORK
% Format: connected(Location_A, Location_B, Distance).
% ==========================================================

% -------------------- Campus Locations --------------------

connected('Main Gate', 'Administration Block', 120).
connected('Main Gate', 'Central Library', 250).
connected('Main Gate', 'Cafeteria', 180).

connected('Administration Block', 'Academic Block', 160).
connected('Administration Block', 'Central Library', 140).

connected('Central Library', 'Academic Block', 110).
connected('Central Library', 'Computer Lab', 170).
connected('Central Library', 'Cafeteria', 130).

connected('Academic Block', 'Computer Lab', 90).
connected('Academic Block', 'Boys Hostel', 240).

connected('Computer Lab', 'Innovation Centre', 100).
connected('Computer Lab', 'Sports Complex', 210).

connected('Innovation Centre', 'Boys Hostel', 150).
connected('Innovation Centre', 'Sports Complex', 180).

connected('Boys Hostel', 'Cafeteria', 160).
connected('Boys Hostel', 'Sports Complex', 140).

connected('Cafeteria', 'Sports Complex', 220).
connected('Sports Complex', 'Parking Area', 100).
connected('Boys Hostel', 'Parking Area', 190).

% ==========================================================
% ROUTING RULES AND DYNAMIC CONSTRAINTS
% ==========================================================

% The map can be travelled in either direction.
route(X, Y, Distance) :-
    connected(X, Y, Distance).

route(X, Y, Distance) :-
    connected(Y, X, Distance).

% These facts are supplied temporarily by the Python program.
:- dynamic blocked_location/1.
:- dynamic restricted_location/1.

% A location is usable when it is not blocked or restricted.
available_location(Location) :-
    \+ blocked_location(Location),
    \+ restricted_location(Location).

% A movement is allowed only when the destination is available.
legal_move(Current, Next, Distance) :-
    route(Current, Next, Distance),
    available_location(Next).

% ==========================================================
% SEARCH ENGINE
% ==========================================================

% Reaching the destination completes the current path.
search_path(Current, Current, Visited, Path, 0) :-
    reverse(Visited, Path).

% Explore an unvisited legal location and accumulate distance.
search_path(Current, Destination, Visited, Path, TotalDistance) :-
    legal_move(Current, Next, StepDistance),
    \+ member(Next, Visited),
    search_path(
        Next,
        Destination,
        [Next|Visited],
        Path,
        RemainingDistance
    ),
    TotalDistance is StepDistance + RemainingDistance.

% Start a search only when both endpoints are available.
find_path(Start, Destination, Path, TotalDistance) :-
    available_location(Start),
    available_location(Destination),
    search_path(Start, Destination, [Start], Path, TotalDistance).

% Collect every simple valid path and return the shortest one.
shortest_path(Start, Destination, BestPath, MinimumDistance) :-
    setof(
        [Distance, Path],
        find_path(Start, Destination, Path, Distance),
        [[MinimumDistance, BestPath]|_]
    ).
