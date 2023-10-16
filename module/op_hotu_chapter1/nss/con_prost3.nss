//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if third time PC speaks to prostitute.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 23, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = ThirdMeetProstitute(GetTag(OBJECT_SELF), GetPCSpeaker());
    return iResult;
}
