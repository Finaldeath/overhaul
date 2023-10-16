//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if shattered mirror plot is over.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = AssimarReturnedHome(GetPCSpeaker());
    return iResult;
}

