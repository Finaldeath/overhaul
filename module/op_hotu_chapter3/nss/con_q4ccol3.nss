//:://////////////////////////////////////////////
/*
     Check if player has attacked twice or more.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = ColonusAttackedByPC2(GetPCSpeaker())&&
              ColonusPlotNotAccepted(GetPCSpeaker());
    return iResult;
}
