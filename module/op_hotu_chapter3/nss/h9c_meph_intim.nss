//::///////////////////////////////////////////////
//:: Mephistopheles, Intimidate Check (Condition Script)
//:: H9c_Meph_Intim.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player successfully
     Intimidates the NPC
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    return AutoDC(DC_MEDIUM, SKILL_INTIMIDATE, GetPCSpeaker());
}

