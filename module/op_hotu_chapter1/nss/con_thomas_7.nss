//::///////////////////////////////////////////////
//:: Check Intelligence Low and PC is NOT on Cynn's Quest
//:: con_thomas_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check Intelligence Low and PC is NOT on Cynn's Quest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "inc_plot_locals"
int StartingConditional()
{
    if (CheckIntelligenceLow() && IsPCOnCynnsQuest(GetPCSpeaker()) == FALSE)
        return TRUE;
    return FALSE;
}

