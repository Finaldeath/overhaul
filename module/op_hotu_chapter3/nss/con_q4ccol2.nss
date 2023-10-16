//:://////////////////////////////////////////////
/*
     Check if player has attacked once.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = ColonusAttackedByPC1(GetPCSpeaker())&&
              ColonusPlotNotAccepted(GetPCSpeaker());
    return iResult;
}
