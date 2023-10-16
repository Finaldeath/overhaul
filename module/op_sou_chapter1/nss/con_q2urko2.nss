//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC asked Urko once already.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 6, 2003
//:://////////////////////////////////////////////
#include "dan_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = UrkoAskedOnceAlready(GetPCSpeaker());
    return iResult;
}
