//::///////////////////////////////////////////////
//:: Name  con_cynn_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if PC knows about Ogre && fairy war.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 28/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "inc_plot_locals"
int StartingConditional()
{
    if ((PCKnowsOfOgreFairyWar(GetPCSpeaker()))&&CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
