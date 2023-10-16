//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This checks if pc has spoken to Shaori 4 times.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = ShaoriSpokeFourTimes(GetPCSpeaker());
    return iResult;
}
