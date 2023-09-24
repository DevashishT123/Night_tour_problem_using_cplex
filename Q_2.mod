/*********************************************
 * OPL 12.5 Model
 * Author: DPL
 * Creation Date: 15-Mar-2023 at 3:25:11 PM
 *********************************************/
 //Devashish Tripathi
 //21IM30031
using CP;
int Scale=10;
range ChessBoard = 1..Scale*Scale;

tuple coord
{
int x;
int y;
};
{coord} Knightmoves2D[i in 1..Scale][j in 1..Scale]=
{<i+2,j+1>,<i+2,j-1>,<i+1,j+2>,<i+1,j-2>,
<i-2,j+1>,<i-2,j-1>,<i-1,j+2>,<i-1,j-2>}
inter {<x,y> | x in 1..Scale ,y in 1..Scale};

{int} Knightmove[i in ChessBoard]={(x-1)*Scale+y | <x,y> in Knightmoves2D[(i-1) div Scale+1][(i-1) % Scale+1]};

dvar int jump[ChessBoard] in ChessBoard;
dvar int Sequence[ChessBoard] in ChessBoard;

execute {
            var f = cp.factory;
        cp.setSearchPhases(f.searchPhase(Sequence));
        cp.param.defaultInferenceLevel="Extended";
}

subject to {
  forall(p in ChessBoard)
    jump[p] in Knightmove[p];
    
   Sequence[1] == jump[1];
   forall(p in 2..Scale*Scale)
     Sequence[p] == jump[Sequence[p-1]];
     
  allDifferent(Sequence);
  allDifferent(jump);
  
  Sequence[Scale*Scale] == 1;
  
  forall(p in ChessBoard)
    sum(c in Knightmove[p]) (jump[c] == p) == 1;
    
};

int rank[1..Scale,1..Scale]=[ (Sequence[i]-1) % Scale+1 : [ (Sequence[i]-1) div Scale+1 : i ] | i in 1..Scale *Scale];

execute
{
 writeln(rank);
}

tuple SequenceSolutionT{
        int ChessBoard;
        int value;
        
};
{SequenceSolutionT} SequenceSolution = {<i0,Sequence[i0]> | i0 in ChessBoard};
tuple jumpSolutionT{
        int ChessBoard;
        int value;
};

{jumpSolutionT} jumpSolution = {<i0,jump[i0]> | i0 in ChessBoard};
     
