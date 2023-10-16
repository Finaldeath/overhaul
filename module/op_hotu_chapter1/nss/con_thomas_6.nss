//::///////////////////////////////////////////////
//:: Check Intelligence Normal and PC is NOT on Cynns Quest
//:: con_thomas_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check Intelligence Normal and PC is NOT on Cynns Quest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "inc_plot_locals"
int StartingConditional()
{
    if (CheckIntelligenceNormal() && IsPCOnCynnsQuest(GetPCSpeaker()) == FALSE)
        return TRUE;
    return FALSE;
}
