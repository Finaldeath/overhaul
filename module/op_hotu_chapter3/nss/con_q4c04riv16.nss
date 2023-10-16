//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This checks if Riv plot is done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"

int StartingConditional()
{
    int iResult;

    iResult = RiviatchHasBookNow(GetPCSpeaker());

    return iResult;
}
