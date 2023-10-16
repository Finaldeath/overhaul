//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has heard about Nora's family, but didn't
    agree to save the baby.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 24, 2003
//:://////////////////////////////////////////////

#include "dan_plot_locals"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1bfamily") == 15)
        return TRUE;
    return FALSE;
}
