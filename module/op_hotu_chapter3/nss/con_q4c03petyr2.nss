//:://////////////////////////////////////////////
/*
     Check if player has heard plot, but not accepted.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = PCKnowsPetyr(GetPCSpeaker());

    return iResult;
}
