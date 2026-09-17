# Intelligent Route Optimization System



## 1. Introduction



The Intelligent Route Optimization System is an Artificial Intelligence project developed using Python and Prolog. The system is designed to find an efficient route between two locations while considering blocked and restricted locations.



Python is used as the execution and user-interface layer, while Prolog is used as the knowledge representation and logical reasoning engine. The combination demonstrates how procedural programming and symbolic AI can be used together to solve a pathfinding problem.



---



## 2. Problem Statement



Finding a suitable route between two locations can become difficult when some locations are unavailable because of restrictions or blockages.



The objective of this project is to develop a route optimization system that:



\- Accepts a starting location and destination.

\- Represents locations and connections as a knowledge base.

\- Searches for possible routes.

\- Calculates the distance of routes.

\- Avoids blocked or restricted locations.

\- Returns a valid route with its total distance.



---



## 3. Objectives



The main objectives of the project are:



1\. To implement a route-planning problem using Artificial Intelligence concepts.

2\. To represent the environment using Prolog facts and rules.

3\. To use search-based reasoning for finding routes.

4\. To integrate Python with Prolog using PySwip.

5\. To handle dynamic route constraints.

6\. To calculate and display the selected route and its distance.

7\. To demonstrate the practical use of symbolic AI.



---



## 4. Technologies Used



### Programming Languages



\- Python

\- Prolog



### Tools and Libraries



\- SWI-Prolog

\- PySwip

\- Python argparse library



### Development Environment



\- Windows

\- Command Prompt / PowerShell



---



## 5. System Architecture



The system consists of the following components:



```text

&#x20;                User

&#x20;                 |

&#x20;                 v

&#x20;         Python Application

&#x20;                 |

&#x20;                 v

&#x20;            PySwip

&#x20;                 |

&#x20;                 v

&#x20;       Prolog Knowledge Base

&#x20;                 |

&#x20;                 v

&#x20;         Route Search Engine

&#x20;                 |

&#x20;                 v

&#x20;         Path and Distance

&#x20;                 |

&#x20;                 v

&#x20;             Output

Python Application



The Python program accepts the starting point, destination, and optional route constraints from the user.



PySwip Interface



PySwip connects the Python application with the SWI-Prolog engine.



Prolog Knowledge Base



The Prolog file stores locations, connections, distances, and logical rules used for route calculation.



Route Search Engine



The Prolog rules explore available paths and calculate their total distance.



6\. Knowledge Representation



The campus environment is represented using Prolog facts.

Campus Map:



![Simulated Campus Map](campus_map.png)



A connection is represented in the following form:

connected('Main Gate', 'Central Library', 250).



Here:



Main Gate is the first location.

Central Library is the connected location.

250 represents the distance between them.



The system also supports movement in both directions through Prolog rules.



7\. Route Search



The system searches for possible routes between the selected starting point and destination.



The search keeps track of visited locations to prevent the same location from being visited repeatedly.



The total route distance is calculated by adding the distance of each connection in the selected path.



The shortest_path rule collects possible valid paths and selects the route with the minimum distance.



8\. Dynamic Constraint Handling



One of the important features of the project is dynamic constraint handling.



Two types of constraints are supported:



Blocked Location



A location can be marked as blocked during program execution.



Example:



python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Administration Block"

Restricted Location



A location can also be marked as restricted:



python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Administration Block"



The Python application sends these temporary conditions to the Prolog knowledge base before route calculation.



9\. Python-Prolog Integration



The project uses PySwip to communicate between Python and Prolog.



The Python program loads the Prolog knowledge base and sends a route query to it.



The route query follows the form:



shortest_path(Start, Destination, Path, Distance)



The result contains:



The calculated path.

The total distance.



Python then formats the result and displays it to the user.



10\. Sample Test Cases

Test Case 1: Normal Route



Command:



python route_optimizer.py --start "Main Gate" --end "Central Library"



Observed result:



OPTIMAL ROUTE FOUND

Path: Main Gate -> Central Library

Distance: 250 units

Test Case 2: Destination Blocked



Command:



python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Central Library"



Observed result:



No valid route was found.

Test Case 3: Destination Restricted



Command:



python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Central Library"



Observed result:



No valid route was found.

Test Case 4: Restricted Intermediate Location



Command:



python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Administration Block"



Observed result:



OPTIMAL ROUTE FOUND

Path: Main Gate -> Central Library

Distance: 250 units

11\. Advantages

Combines Python with symbolic AI.

Uses logical knowledge representation.

Supports dynamic route constraints.

Prevents repeated locations during path search.

Provides route distance along with the path.

Can be extended with additional locations and rules.

Demonstrates practical use of Prolog in Artificial Intelligence.

12\. Limitations

The current system uses a predefined knowledge base.

The interface is command-line based.

Distances are manually defined in the knowledge base.

The system does not currently use live map or GPS data.

The current environment represents a simulated route network.

13\. Future Scope



The project can be extended by:



Adding a graphical user interface.

Displaying the route on a visual map.

Adding more locations and route conditions.

Supporting real-time location data.

Adding traffic or congestion information.

Introducing multiple route optimization criteria.

Connecting the system with real-world map services.

Adding visualization of blocked and restricted locations.

14\. Conclusion



The Intelligent Route Optimization System demonstrates the application of Artificial Intelligence concepts to a route-planning problem.



The project combines Python for application control with Prolog for knowledge representation and logical route reasoning. Dynamic constraints allow locations to be blocked or restricted during execution.



Testing confirmed that the system can find a route under normal conditions and reject routes when the destination is unavailable. The project provides a practical demonstration of symbolic reasoning, search, knowledge representation, and Python-Prolog integration.



15\. Developer



Ayan Sharma



Integrated M.Tech in Artificial Intelligence

VIT Bhopal University



Registration Number: 25MIM10136

