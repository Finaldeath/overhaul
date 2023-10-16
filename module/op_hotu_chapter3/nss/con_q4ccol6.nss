//:://////////////////////////////////////////////
/*
     Check if player has met Colonus and two aasimar.
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

    iResult = PCHasMetTwoAasimar(GetPCSpeaker());
              CheckIntelligenceLow();
    return iResult;
}

