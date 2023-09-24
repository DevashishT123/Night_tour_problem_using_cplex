# Knight_tour_problem_using_cplex

Problem Description:
The problem at hand is the "Knight's Tour" problem, a classic chess puzzle. In this problem, you are given a chessboard of size N x N and a knight placed on one of the squares. The knight moves according to the rules of chess, making "L"-shaped moves: it can move two squares horizontally and one square vertically or two squares vertically and one square horizontally. The objective is to find a sequence of moves for the knight such that it visits every square on the chessboard exactly once, returning to the starting position either as a closed tour (one knight's move away) or an open tour (finishing anywhere else).

Techniques Used:
1. **Constraint Programming (CP)**:
   - The problem is solved using Constraint Programming techniques, which involve defining variables, domains, and constraints to find a solution that satisfies all the given conditions.

2. **CPLEX Solver**:
   - The CPLEX solver is used to efficiently solve the constraint programming problem and find a solution that meets the specified constraints.

3. **Modeling the Chessboard**:
   - The chessboard is represented as a grid with coordinates (x, y) using the `coord` tuple.
   - `Knightmoves2D` defines all the possible knight moves from each square on the chessboard, ensuring they adhere to the knight's movement rules.

4. **Decision Variables**:
   - `jump[p]` represents the destination square for the knight's jump from square `p`.
   - `Sequence[p]` represents the sequence of squares visited by the knight.

5. **Search Phase Configuration**:
   - The search phase is configured using the CPLEX search phase function to guide the solver in finding a solution efficiently.

Contents:
- The code begins by defining the chessboard size (`Scale`) and the range of squares (`ChessBoard`).
- It models the knight's movement using the `Knightmoves2D` tuple, which lists all possible knight moves.
- Decision variables are defined: `jump` to represent the destination of each jump and `Sequence` to represent the sequence of squares visited.
- The code configures the search phase to optimize the solution.
- Constraints are specified:
   - Ensure that each jump is valid according to knight's moves.
   - Specify that the sequence must start with the first square and continue with valid jumps.
   - Ensure that all squares in the sequence are different (visited only once).
   - Close the tour by making the last move return to the starting square (square 1).
   - Ensure that each square is reached only once during the tour.
- The code computes and prints the ranking of squares in the final solution, indicating the order in which they were visited.
- Finally, it defines tuples `SequenceSolution` and `jumpSolution` to store and display the solution.

The code, when executed with a specific chessboard size (`Scale`), will find a solution to the Knight's Tour problem, either as a closed tour or an open tour, where the knight visits each square exactly once while adhering to the knight's movement rules and other constraints.
