//::///////////////////////////////////////////////
//:: Check PC is on Cynns Quest
//:: con_thomas_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC is on Cynns Quest
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////


#include "inc_plot_locals"
int StartingConditional()
{
    if (IsPCOnCynnsQuest(GetPCSpeaker()))
        return TRUE;
    return FALSE;
}
