//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This checks if npc is looking for names.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"

int StartingConditional()
{
    int iResult;

    iResult = FirstMeetRiviatch(GetPCSpeaker());

    return iResult;
}
