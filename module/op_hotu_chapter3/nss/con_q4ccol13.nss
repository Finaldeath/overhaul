//:://////////////////////////////////////////////
/*
     Check if player has heard Colonus's story.
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

    iResult = PCHasHeardColStory2(GetPCSpeaker());
              CheckIntelligenceNormal();
    return iResult;
}
