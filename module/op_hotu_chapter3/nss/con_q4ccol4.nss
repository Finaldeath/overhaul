//:://////////////////////////////////////////////
/*
     Check if player is on mirror plot.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = ColonusGavePlot(GetPCSpeaker());
    return iResult;
}
