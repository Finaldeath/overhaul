//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC met Urko once and came back.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 6, 2003
//:://////////////////////////////////////////////
#include "dan_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = UrkoMetOnce(GetPCSpeaker());
    return iResult;
}
