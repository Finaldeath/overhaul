//:://////////////////////////////////////////////
/*
     Check if player chose good path.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = AssimarReturnedHome(GetPCSpeaker());
    return iResult;
}
