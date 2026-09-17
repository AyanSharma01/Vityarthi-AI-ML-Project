Vityarthi AI/ML Project

Intelligent Route Optimization System

GitHub Repository: https://github.com/AyanSharma01/Vityarthi-AI-ML-Project

An AI-based route optimization system that uses Python and Prolog to find efficient paths between locations in a simulated university-campus network while considering dynamic blocked and restricted locations.

Project note: The campus map and route distances used by this academic project are simulated representations created for demonstration. They are not intended to represent an official VIT Bhopal navigation system.

Project Overview

This project demonstrates how Python and Prolog can be combined to solve a route-planning problem using symbolic knowledge representation, logical reasoning, recursive search, distance calculation, and constraint handling.

The Python program provides the command-line interface and application control, while the Prolog knowledge base stores the route network and performs the logical path search.

AI Concepts Used

1. Knowledge Representation

Locations, connections, distances, and route rules are represented using Prolog facts and rules.

2. Search

The Prolog search explores possible simple paths between a starting location and destination while tracking visited locations.

3. Constraint Handling

Locations can be supplied at runtime as blocked or restricted. These locations are excluded from valid route calculations.

4. Decision Making

The system compares valid candidate paths using their accumulated distance and returns the shortest available route.

Main Features

Route optimization between two campus locations.

Knowledge-based representation using Prolog.

Bidirectional route traversal.

Distance-aware path selection.

Dynamic blocked-location handling.

Dynamic restricted-location handling.

Clear command-line output.

No-route handling when the requested destination is unavailable.

System Architecture

User Input
    |
    v
Python Command-Line Application
    |
    v
PySwip Interface
    |
    v
Prolog Knowledge Base
    |
    v
Logical Route Search
    |
    v
Shortest Valid Path
    |
    v
Route + Distance Output

Campus Locations

The simulated network contains these locations:

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

Main Components

route_optimizer.py

The Python execution layer. It:

accepts the start and destination;

accepts optional blocked/restricted locations;

starts the Prolog engine;

loads the knowledge base;

sends the route query;

displays the resulting path and distance.

knowledge_base.pl

Contains the simulated campus route facts, bidirectional route rules, dynamic constraints, and recursive path-search logic.

requirements.txt

Contains the Python dependency required by the application.

project_report.md

Contains detailed project documentation, requirements, architecture, design, implementation, testing, challenges, and future enhancements.

statement.md

Contains the problem statement, project scope, target users, and high-level features.

campus_map.png

Illustrative project map showing the simulated campus locations used as the conceptual environment for the project.

Installation

1. Clone the Repository

git clone https://github.com/AyanSharma01/Vityarthi-AI-ML-Project.git
cd Vityarthi-AI-ML-Project

2. Requirements

Python 3.8 or later

SWI-Prolog

PySwip 0.3.3

3. Install Python Dependencies

pip install -r requirements.txt

Make sure SWI-Prolog is installed and available through the system PATH before running the Python program.

Running the Project

Basic Route Search

python route_optimizer.py --start "Main Gate" --end "Central Library"

Route with a Blocked Location

python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Administration Block"

Route with a Restricted Location

python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Administration Block"

Multiple Blocked Locations

python route_optimizer.py --start "Main Gate" --end "Sports Complex" --blocked "Central Plaza" "Auditorium"

Location names must match the names defined in knowledge_base.pl.

Example Output

========================================================
              AI ROUTE OPTIMIZER
========================================================
[>] Start       : Main Gate
[>] Destination : Central Library
[>] Searching for a valid route...

[+] OPTIMAL ROUTE FOUND
    Path     : Main Gate -> Administration Block -> Academic Block -> Central Library
    Distance : 390 units
========================================================

Testing

The project can be tested using normal route searches and dynamic constraints.

Example:

python route_optimizer.py --start "Main Gate" --end "Central Library"

Blocked destination:

python route_optimizer.py --start "Main Gate" --end "Central Library" --blocked "Central Library"

Restricted destination:

python route_optimizer.py --start "Main Gate" --end "Central Library" --restricted "Central Library"

Project Structure

Vityarthi-AI-ML-Project/
│
├── route_optimizer.py
├── knowledge_base.pl
├── requirements.txt
├── README.md
├── statement.md
├── project_report.md
├── campus_map.png
└── .gitignore

Developer

Ayan Sharma
Integrated M.Tech in Artificial Intelligence
VIT Bhopal University

Registration Number: 25MIM10136
