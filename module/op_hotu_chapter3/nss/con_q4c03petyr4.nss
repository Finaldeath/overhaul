//:://////////////////////////////////////////////
/*
     Check if player has rescued apprentice.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = PCSavedApprentice(GetPCSpeaker());
              CheckIntelligenceNormal();

    return iResult;
}
