import argparse
import sys
from pyswip import Prolog


PROLOG_FILE = "knowledge_base.pl"


def load_knowledge_base():
    """Start Prolog and load the route knowledge base."""
    prolog = Prolog()

    try:
        prolog.consult(PROLOG_FILE)
    except Exception as exc:
        print(
            f"\n[ERROR] Unable to load '{PROLOG_FILE}'. "
            "Make sure the Prolog knowledge-base file is in the project folder."
        )
        print(f"Details: {exc}")
        sys.exit(1)

    return prolog


def clear_constraints(prolog):
    """Remove constraints left by an earlier route calculation."""
    list(prolog.query("retractall(blocked_location(_))"))
    list(prolog.query("retractall(restricted_location(_))"))


def add_constraints(prolog, blocked_locations, restricted_locations):
    """Add temporary route constraints to the Prolog knowledge base."""
    for location in blocked_locations:
        prolog.assertz(f"blocked_location('{location}')")
        print(f"[!] Blocked location: {location}")

    for location in restricted_locations:
        prolog.assertz(f"restricted_location('{location}')")
        print(f"[!] Restricted location: {location}")


def optimize_route(start, end, blocked_locations=None, restricted_locations=None):
    """Find and display an optimized route between two locations."""
    blocked_locations = blocked_locations or []
    restricted_locations = restricted_locations or []

    prolog = load_knowledge_base()
    clear_constraints(prolog)
    add_constraints(prolog, blocked_locations, restricted_locations)

    print("\n" + "=" * 56)
    print("              AI ROUTE OPTIMIZER")
    print("=" * 56)
    print(f"[>] Start       : {start}")
    print(f"[>] Destination : {end}")
    print("[>] Searching for a valid route...")

    query = (
        f"shortest_path('{start}', '{end}', Path, Distance)"
    )

    try:
        results = list(prolog.query(query))

        if not results:
            print("\n[X] No valid route was found.")
            print("    Try another destination or remove a blocking constraint.")
            return

        selected = results[0]
        path = [
            node.decode("utf-8") if isinstance(node, bytes) else str(node)
            for node in selected["Path"]
        ]

        print("\n[+] OPTIMAL ROUTE FOUND")
        print(f"    Path     : {' -> '.join(path)}")
        print(f"    Distance : {selected['Distance']} units")

    except Exception as exc:
        print(f"\n[ERROR] Route calculation failed: {exc}")

    print("=" * 56)


def main():
    parser = argparse.ArgumentParser(
        description="AI-based route optimization using Python and Prolog."
    )
    parser.add_argument("--start", required=True, help="Starting location")
    parser.add_argument("--end", required=True, help="Destination")
    parser.add_argument(
        "--blocked",
        nargs="+",
        default=[],
        help="Locations that should be avoided",
    )
    parser.add_argument(
        "--restricted",
        nargs="+",
        default=[],
        help="Locations treated as restricted",
    )

    args = parser.parse_args()

    optimize_route(
        args.start,
        args.end,
        args.blocked,
        args.restricted,
    )


if __name__ == "__main__":
    main()
