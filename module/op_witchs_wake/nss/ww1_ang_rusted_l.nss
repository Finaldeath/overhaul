//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Rusted Grave Goods (Low Int)
//:: WW1_Ang_Rusted_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE is the player is carrying at
     least one of the rusted grave goods stolen
     from the Night Hag's cemetery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oAxe = GetItemPossessedBy(oPC, "ww1_graveaxe");
    object oHelm = GetItemPossessedBy(oPC, "ww1_gravehelm");
    object oSword = GetItemPossessedBy(oPC, "ww1_gravesword");

    if (oAxe != OBJECT_INVALID ||
        oHelm != OBJECT_INVALID ||
        oSword != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
