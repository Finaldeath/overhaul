//:://////////////////////////////////////////////
/*
     Check if player has fixed at least one piece.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = PCPlacedMirrorPiece(GetPCSpeaker());
              CheckIntelligenceNormal();
    return iResult;
}
