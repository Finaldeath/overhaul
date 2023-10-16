//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Did Cynns husband die and pc told her?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    if (CynnsQuestOverBad(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}

