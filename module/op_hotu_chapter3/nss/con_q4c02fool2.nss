//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets spoke to Jester twice.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: October 2002.
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = JesterMetOnce(GetPCSpeaker());
    return iResult;
}
