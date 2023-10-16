//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, PC From Barak'Thule (Normal Int)
//:: WW1_Hag_Barak_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has learned that
    they are from Barak'Thule. (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bCaldConv = GetLocalInt(oPC, "XP_KN_FromBarakThule");
    int bMineMsg07 = GetLocalInt(oPC, "XP_KN_MinesMessage07");
    int bMineMsg14 = GetLocalInt(oPC, "XP_KN_MinesMessage14");

    if (bCaldConv == TRUE ||
        bMineMsg07 == TRUE ||
        bMineMsg14 == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
