//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Has pc found Cynns husband and told her?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    if (PCSolvedCynnsQuest(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
