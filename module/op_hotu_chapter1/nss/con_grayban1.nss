//::///////////////////////////////////////////////
//:: Name: q2a_buck_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Grayban will open the door to the Waterdeep
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 7/02
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = GraybanOpenedDoor(GetPCSpeaker());
    return iResult;
}
