//:://////////////////////////////////////////////
/*
     Check if player has met Colonus.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = ColonusNotMet(GetPCSpeaker());
    return iResult;
}

