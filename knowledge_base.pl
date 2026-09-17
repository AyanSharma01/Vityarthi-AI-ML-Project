% ==========================================================
% KNOWLEDGE BASE: SIMULATED VIT BHOPAL CAMPUS ROUTE NETWORK
% Format: connected(Location_A, Location_B, Distance).
%
% Note: This is a simulated academic route network created
% for the project. It is not intended as an official campus map.
% ==========================================================

% -------------------- Campus Locations --------------------

connected('Main Gate', 'Administration Block', 120).
connected('Main Gate', 'Parking Lot', 100).
connected('Main Gate', 'Student Activity Center', 140).
connected('Main Gate', 'Medical Center', 210).

connected('Administration Block', 'Academic Block', 160).
connected('Administration Block', 'Central Plaza', 130).
connected('Administration Block', 'Medical Center', 150).
connected('Administration Block', 'Computer Science Block', 180).

connected('Academic Block', 'Central Library', 110).
connected('Academic Block', 'Hostel Block', 240).
connected('Academic Block', 'Computer Science Block', 90).

connected('Central Library', 'Research Block', 130).
connected('Central Library', 'Central Plaza', 100).
connected('Central Library', 'Computer Science Block', 170).

connected('Research Block', 'Auditorium', 120).
connected('Research Block', 'Central Plaza', 150).

connected('Central Plaza', 'Auditorium', 100).
connected('Central Plaza', 'Computer Science Block', 140).
connected('Central Plaza', 'Student Activity Center', 160).

connected('Auditorium', 'Cafeteria', 90).
connected('Auditorium', 'Sports Complex', 180).

connected('Cafeteria', 'Sports Complex', 220).
connected('Cafeteria', 'Residential Area', 170).

connected('Computer Science Block', 'Sports Complex', 210).
connected('Computer Science Block', 'Student Activity Center', 120).

connected('Sports Complex', 'Parking Lot', 100).
connected('Sports Complex', 'Residential Area', 130).

connected('Student Activity Center', 'Parking Lot', 110).
connected('Student Activity Center', 'Residential Area', 150).

connected('Hostel Block', 'Medical Center', 180).
connected('Hostel Block', 'Residential Area', 220).
connected('Hostel Block', 'Student Activity Center', 190).

connected('Medical Center', 'Parking Lot', 130).

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
