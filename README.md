# Vityarthi AI/ML Project

## Intelligent Route Optimization System

**GitHub Repository:** https://github.com/AyanSharma01/Vityarthi-AI-ML-Project


An AI-based route optimization system that uses Python and Prolog to find efficient paths between locations while considering dynamic constraints.

## Project Overview

This project demonstrates how Python and Prolog can be combined to solve a route-planning problem using symbolic knowledge representation, logical reasoning, search, and constraint handling.

The Python program provides the command-line interface, while the Prolog knowledge base stores the environment and performs route reasoning.

## AI Concepts Used

### 1. Knowledge Representation

The environment is represented using logical facts and rules in Prolog. Locations and connections are stored in the knowledge base so that the system can reason about possible routes.

### 2. Search

The system searches through possible paths between a starting point and a destination and obtains a route from the Prolog knowledge base.

### 3. Constraint Handling

Temporary constraints can be supplied during execution. Locations marked as blocked or restricted are passed to the Prolog system before route calculation.

### 4. Decision Making

The route returned by the knowledge base is evaluated using the project's route-search logic, allowing the system to select a route together with its calculated distance.

## System Architecture

```text
                 User Input
                     |
                     v
              Python Application
                     |
                     v
             PySwip Interface
                     |
                     v
              Prolog Knowledge
                  Base
                     |
                     v
              Route Calculation
                     |
                     v
             Path + Distance
```

## Main Components

### `route_optimizer.py`

The Python execution layer. It:

- accepts the start and destination;
- accepts optional blocked/restricted locations;
- starts the Prolog engine;
- loads the knowledge base;
- sends the route query;
- displays the resulting path and distance.

### `knowledge_base.pl`

The Prolog knowledge base containing the map facts, route rules, and path-search logic.

### `requirements.txt`

Contains the Python dependencies required by the application.

### `project_report.md`

Contains the detailed project documentation, methodology, implementation details, testing, and conclusion.

## Installation

### Clone This Repository

```bash
git clone https://github.com/AyanSharma01/Vityarthi-AI-ML-Project.git
cd Vityarthi-AI-ML-Project
```

### Requirements

- Python 3.8 or later
- SWI-Prolog
- PySwip

### Install Python dependencies

```bash
pip install -r requirements.txt
```

Make sure SWI-Prolog is installed and available through the system PATH before running the Python program.

## Running the Project

The application is command-line based.

### Basic route search

```bash
python route_optimizer.py --start "Main Gate" --end "Central Library"
```

### Route with blocked locations

```bash
python route_optimizer.py --start "Boys Hostel" --end "Central Library" --blocked "Cafeteria"
```

### Route with restricted locations

```bash
python route_optimizer.py --start "Boys Hostel" --end "Central Library" --restricted "Main Gate"
```

> The location names used in these examples must exist in the Prolog knowledge base.

## Example Output

```text
========================================================
              AI ROUTE OPTIMIZER
========================================================
[>] Start       : Main Gate
[>] Destination : Central Library
[>] Searching for a valid route...

[+] OPTIMAL ROUTE FOUND
    Path     : Main Gate -> Central Library
    Distance : 150 units
========================================================
```

## Project Structure

```text
Vityarthi-AI-ML-Project/
│
├── route_optimizer.py
├── knowledge_base.pl
├── requirements.txt
├── README.md
├── project_report.md
├── campus_map.png
└── .gitignore
```

## Developer

**Ayan Sharma**  
Integrated M.Tech in Artificial Intelligence  
VIT Bhopal University

**Registration Number:** 25MIM10136
