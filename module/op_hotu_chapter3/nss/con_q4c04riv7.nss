//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This checks if pc has spoken to Petyr.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = SpokeToPetyrOnce(GetPCSpeaker());
              CheckIntelligenceNormal();
    return iResult;
}
