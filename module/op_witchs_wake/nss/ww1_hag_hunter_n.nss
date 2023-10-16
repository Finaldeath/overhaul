//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, PC Is Witch Hunter (Normal Int)
//:: WW1_Hag_Hunter_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has learned that
    they are a Witch Hunter. (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bHunter = GetLocalInt(oPC, "XP_KN_TheWitchHunters");

    if (bHunter == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
