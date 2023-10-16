//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Hag Is Ragpicker (Low Int)
//:: WW1_Hag_Ragp_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has been introduced
    to the idea that the Night Hag and the
    Ragpicker might be the same person (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bHagIsRagp = GetLocalInt(oPC, "XP_KN_HagIsRagpicker");
    int bHagIsShapechanger = GetLocalInt(oPC, "HagIsShapechanger");

    if (bHagIsRagp == TRUE ||
        bHagIsShapechanger == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
