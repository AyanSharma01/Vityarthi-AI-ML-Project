# Project Statement

## 1. Problem Statement

Route planning becomes difficult when some locations in a network are blocked or temporarily restricted. A route that is normally available may become invalid when conditions change.

This project develops an intelligent route optimization system that represents a network of locations using a Prolog knowledge base and uses logical search to find a valid route between a selected starting location and destination. The system can also consider dynamically blocked or restricted locations while searching for a route.

## 2. Project Scope

The project focuses on route optimization in a simulated university-campus environment.

The system includes:
- Representation of locations and connections as a logical knowledge base.
- Route searching between a starting location and destination.
- Distance calculation for available routes.
- Handling of dynamically blocked locations.
- Handling of dynamically restricted locations.
- Command-line execution using Python and Prolog.

The current project uses a simulated campus network rather than a real-world navigation service.

## 3. Target Users

The system is intended for:
- Students learning Artificial Intelligence and logic programming.
- Faculty members evaluating AI/ML concepts through a working project.
- Users who want to understand logical route planning and constraint-based pathfinding.
- Developers interested in combining Python with Prolog for AI applications.

## 4. High-Level Features

1. **Route Optimization**  
   Finds an available route between a specified start location and destination.

2. **Knowledge-Based Map Representation**  
   Stores campus locations, connections, and distances in a Prolog knowledge base.

3. **Dynamic Location Constraints**  
   Allows locations to be marked as blocked or restricted during execution.

4. **Logical Path Search**  
   Uses Prolog-based recursive search to identify valid paths and select the shortest available route.

5. **Command-Line Interface**  
   Allows the complete system to be executed from the terminal using user-provided start, destination, blocked, and restricted locations.

## 5. Main Technologies

- Python
- Prolog
- PySwip
- SWI-Prolog
- Command-line interface

## 6. Expected Input and Output

### Input
The user provides:
- Starting location
- Destination
- Optional blocked locations
- Optional restricted locations

### Output
The system displays:
- Whether a valid route exists
- The selected route
- The calculated route distance
- A message when no valid route is available
