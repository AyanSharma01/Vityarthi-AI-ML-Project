Intelligent Route Optimization System

Project Report

Submitted for: VITyarthi – Build Your Own Project
Submitted by: Ayan Sharma
Programme: Integrated M.Tech in Artificial Intelligence
University: VIT Bhopal University
Registration Number: 25MIM10136
Project Domain: Artificial Intelligence / Logic Programming
Date: September 2026

1. Introduction

The Intelligent Route Optimization System is a command-line Artificial Intelligence project that demonstrates knowledge representation, logical reasoning, recursive search, and constraint handling using Python and Prolog.

The system models a simulated university-campus route network containing locations such as the Main Gate, Administration Block, Academic Block, Central Library, Research Block, Auditorium, Cafeteria, Computer Science Block, Medical Center, Sports Complex, Student Activity Center, Hostel Block, Residential Area, Parking Lot, and Central Plaza.

Python provides the command-line interface and application control, while Prolog stores the route knowledge and performs logical path reasoning.

Important scope note: The campus map and route distances in this project are simulated for academic demonstration. The system is not an official VIT Bhopal navigation or mapping service.

A key feature is dynamic constraint handling. During execution, a user can mark locations as blocked or restricted. The system applies these temporary constraints before searching for a valid route.

2. Problem Statement

Finding an efficient route between two locations becomes more challenging when one or more locations are temporarily unavailable.

A route-planning system should therefore:

represent locations and their connections;

store route distances;

search possible paths;

avoid blocked or restricted locations;

compare valid routes;

return a shortest valid route when one exists;

clearly report when no valid route is available.

This project addresses the problem using a knowledge-based approach with Prolog logical rules and a Python command-line interface.

3. Objectives

Implement a route-planning problem using Artificial Intelligence concepts.

Represent the simulated campus environment using Prolog facts and rules.

Use recursive search-based reasoning to find valid routes.

Calculate total route distance.

Select the shortest valid route among available candidates.

Integrate Python and Prolog using PySwip.

Handle dynamic blocked and restricted locations.

Provide clear command-line results for successful and unsuccessful searches.

4. Scope and Target Users

4.1 Scope

The current implementation operates on a predefined simulated campus network. It does not depend on GPS, live traffic, or an external mapping service.

The project demonstrates:

knowledge representation;

logical search;

pathfinding;

dynamic constraints;

Python–Prolog integration;

command-line execution.

4.2 Target Users

The system is intended for:

students learning Artificial Intelligence and logic programming;

faculty members evaluating AI concepts through a working implementation;

users learning constraint-based route planning;

developers exploring Python and Prolog integration.

5. Functional Requirements

FR1. The system shall accept a starting location.

FR2. The system shall accept a destination.

FR3. The system shall load route facts and rules from the Prolog knowledge base.

FR4. The system shall support blocked locations.

FR5. The system shall support restricted locations.

FR6. The system shall search for valid paths while avoiding unavailable locations.

FR7. The system shall calculate the total distance of a candidate path.

FR8. The system shall select the shortest valid route.

FR9. The system shall display the route and distance when a valid route exists.

FR10. The system shall display a clear no-route message when no valid route exists.

6. Non-Functional Requirements

NFR1 – Usability: The command-line interface should provide simple commands and understandable output.

NFR2 – Reliability: The system should not return a route through a blocked or restricted location.

NFR3 – Maintainability: Route data and logical search rules are separated from the Python application layer.

NFR4 – Performance: The route-search process should complete efficiently for the simulated network.

NFR5 – Error Handling: Route-search failures should be reported clearly.

NFR6 – Portability: The project should operate with Python, SWI-Prolog, and PySwip on a supported system.

7. Technologies Used

Programming Languages

Python

Prolog

Tools and Libraries

SWI-Prolog

PySwip 0.3.3

Python argparse

Development Environment

Windows

Command Prompt / PowerShell

GitHub

8. System Architecture

The system uses a layered architecture.

                 User
                   |
                   v
        Command-Line Interface
                   |
                   v
          Python Controller
                   |
                   v
             PySwip Bridge
                   |
                   v
       Prolog Knowledge Base
                   |
                   v
        Logical Search Engine
                   |
                   v
          Path + Distance
                   |
                   v
                Output

Component Responsibilities

Command-Line Interface: Receives start, destination, blocked, and restricted locations.

Python Controller: Loads the Prolog knowledge base, clears old constraints, applies current constraints, executes the route query, and formats the output.

PySwip Bridge: Connects the Python application with the SWI-Prolog engine.

Prolog Knowledge Base: Stores locations, connections, distances, constraints, and search rules.

Logical Search Engine: Explores valid paths, avoids repeated locations, calculates accumulated distances, and selects the shortest valid path.

9. Design Diagrams

9.1 Workflow

+-------------+
| User Input  |
+------+------+
       |
       v
+------------------+
| Validate Request |
+--------+---------+
         |
         v
+----------------------+
| Load Knowledge Base  |
+----------+-----------+
           |
           v
+----------------------+
| Apply Constraints    |
| Blocked / Restricted |
+----------+-----------+
           |
           v
+----------------------+
| Search Valid Paths   |
+----------+-----------+
           |
           v
+----------------------+
| Select Minimum       |
| Distance             |
+----------+-----------+
           |
           v
+----------------------+
| Display Route/Result |
+----------------------+

9.2 Use Cases

Actor: User

The user can:

enter a route request;

specify blocked locations;

specify restricted locations;

view the selected route;

view route distance;

receive a no-route result.

9.3 Sequence of a Route Query

The user enters the start and destination.

Optional blocked/restricted locations are supplied.

Python loads the Prolog knowledge base.

Existing temporary constraints are cleared.

Current constraints are asserted.

Python sends a shortest_path query through PySwip.

Prolog searches legal paths.

Prolog compares route distances.

The selected route and distance are returned to Python.

Python displays the result.

9.4 Component View

+-------------------+
| Command-Line User |
+---------+---------+
          |
          v
+-------------------+
| route_optimizer.py|
+---------+---------+
          |
          v
+-------------------+
|      PySwip       |
+---------+---------+
          |
          v
+-------------------+
| knowledge_base.pl |
| Facts + Rules     |
| Search + Rules    |
+---------+---------+
          |
          v
+-------------------+
| Path + Distance   |
+-------------------+

10. Campus Map and Knowledge Representation

The project uses a simulated campus map as the conceptual environment.



Figure 1. Simulated campus environment used for the academic project.

The network contains the following key locations:

Main Gate

Administration Block

Academic Block

Central Library

Research Block

Auditorium

Cafeteria

Computer Science Block

Medical Center

Sports Complex

Student Activity Center

Hostel Block

Residential Area

Parking Lot

Central Plaza

A route is represented using the form:

connected('Main Gate', 'Central Library', 250).

The three elements represent:

source location;

connected destination;

route distance.

Bidirectional movement is implemented using the route/3 rules.

11. Route Search Method

The Prolog search recursively explores possible routes.

The search:

starts from the requested source;

checks whether the next location is available;

avoids locations already visited;

accumulates route distance;

continues until the destination is reached.

The visited-location list prevents repeated traversal of the same location during a single path search.

The shortest_path/4 rule collects valid simple paths and selects the candidate with the minimum total distance.

12. Dynamic Constraint Handling

The system supports two temporary constraints.

12.1 Blocked Location

A blocked location cannot be used during route calculation.

Example:

python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Administration Block"

12.2 Restricted Location

A restricted location is also excluded from the available route network.

Example:

python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Central Plaza"

The Python program sends these temporary constraints to Prolog before the route query.

13. Python–Prolog Integration

The project uses PySwip to communicate between Python and SWI-Prolog.

The Python program:

creates a Prolog instance;

consults knowledge_base.pl;

clears previous dynamic constraints;

adds the current blocked/restricted locations;

sends the route query.

The main Prolog query is:

shortest_path(Start, Destination, Path, Distance)

The returned result contains:

the selected path;

the total route distance.

Python then formats and displays the result.

14. Command-Line Execution

Basic Route

python route_optimizer.py --start "Main Gate" --end "Central Library"

Blocked Location

python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Central Plaza"

Restricted Location

python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Administration Block"

Multiple Constraints

python route_optimizer.py --start "Main Gate" --end "Sports Complex" --blocked "Central Plaza" "Auditorium"

15. Design Decisions and Rationale

Prolog for Knowledge Representation

Prolog is suitable for representing locations, connections, constraints, and logical rules.

Python for Application Control

Python provides convenient command-line argument handling and output formatting.

PySwip for Integration

PySwip provides the bridge between Python and SWI-Prolog.

Dynamic Constraints

Blocked and restricted locations are stored as temporary runtime facts, allowing route conditions to change without modifying the permanent route network.

Recursive Search

Recursive search provides a direct way to explore connected locations while maintaining the visited-location list.

Distance-Based Selection

Candidate paths are compared using accumulated route distance, allowing the system to select the shortest valid route.

16. Implementation Details

16.1 route_optimizer.py

The Python program handles:

command-line arguments;

Prolog initialization;

knowledge-base loading;

constraint management;

route querying;

result formatting.

16.2 knowledge_base.pl

The Prolog file contains:

campus route facts;

bidirectional route rules;

dynamic blocked/restricted predicates;

location availability rules;

legal movement rules;

recursive search;

shortest-path selection.

16.3 requirements.txt

The Python dependency is:

PySwip==0.3.3

16.4 README.md

Provides installation, execution, testing, architecture, project structure, and usage instructions.

16.5 statement.md

Provides the problem statement, project scope, target users, high-level features, and expected input/output.

17. Testing Approach and Results

Testing focuses on normal route calculation and dynamic constraint handling.

Test Case

Condition

Expected Result

Status

TC-01

Normal route from Main Gate to Central Library

Valid route and distance

PASS

TC-02

Central Library blocked

No valid route

PASS

TC-03

Central Library restricted

No valid route

PASS

TC-04

Administration Block restricted

Another valid route can be considered

PASS

TC-05

Multiple intermediate locations blocked

Search avoids unavailable locations

PASS

Example Normal Test

python route_optimizer.py --start "Main Gate" --end "Central Library"

The system searches the available network and returns a valid route with its calculated distance.

Destination Constraint Test

python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Central Library"

The destination becomes unavailable, so the system reports that no valid route was found.

18. Challenges Faced

Connecting Python with the SWI-Prolog runtime using PySwip.

Maintaining a separate logical knowledge base.

Handling dynamic constraints at runtime.

Preventing repeated locations during recursive search.

Handling situations where no valid route exists.

Keeping the application fully executable through the command line.

19. Advantages

Demonstrates symbolic Artificial Intelligence.

Uses logical knowledge representation.

Supports dynamic route constraints.

Searches routes recursively.

Provides route distance.

Separates application logic from knowledge representation.

Can be extended with additional locations and rules.

20. Limitations

The route network is simulated and predefined.

Route distances are manually defined.

The interface is command-line based.

No live GPS data is used.

No live traffic information is used.

The system is intended for an academic demonstration rather than real-world navigation.

21. Learnings and Key Takeaways

Through this project, the following concepts were practiced:

Representing a real-world-style environment using logical facts.

Using Prolog rules for symbolic reasoning.

Applying recursive search to pathfinding.

Handling dynamic constraints.

Integrating Python with Prolog using PySwip.

Designing a command-line AI application.

Testing successful and unsuccessful search cases.

Separating data, reasoning, and application-control responsibilities.

22. Future Enhancements

Possible future improvements include:

Graphical route visualization.

Interactive campus-map route display.

Larger route networks.

Real-time location information.

Traffic and congestion information.

Multiple optimization criteria such as time or accessibility.

Automated unit and integration tests.

Richer logging and diagnostics.

Integration with real-world map services.

23. Conclusion

The Intelligent Route Optimization System demonstrates the application of Artificial Intelligence concepts to a route-planning problem using Python and Prolog.

The project combines knowledge representation, logical reasoning, recursive search, dynamic constraints, and distance-based route selection. Python provides the command-line application layer, while Prolog performs the logical route reasoning.

Testing demonstrates that the system can identify valid routes under normal conditions and reject destinations that are blocked or restricted.

The project provides a practical academic example of how symbolic AI techniques can be integrated into a working software application.

24. References

SWI-Prolog documentation — Prolog language and execution environment.

PySwip documentation — Python interface for SWI-Prolog.

Python documentation — command-line argument handling and application development.

VITyarthi Build Your Own Project guidelines — project structure, documentation, testing, and submission requirements.

25. Project Repository

GitHub: https://github.com/AyanSharma01/Vityarthi-AI-ML-Project

26. Developer

Ayan Sharma
Integrated M.Tech in Artificial Intelligence
VIT Bhopal University
Registration Number: 25MIM10136
