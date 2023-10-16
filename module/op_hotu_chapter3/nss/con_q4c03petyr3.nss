//:://////////////////////////////////////////////
/*
     Check if player has heard plot and accepted.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = PCOnPetyrsPlot(GetPCSpeaker());

    return iResult;
}
