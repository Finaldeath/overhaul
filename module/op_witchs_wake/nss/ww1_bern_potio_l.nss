//::///////////////////////////////////////////////
//:: Witchwork 1: Bernhardt, Quest Active & Have Potion (Low Int)
//:: WW1_Bern_Potio_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player on the Potion
    Quest and has the potion.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bQuestActive = GetLocalInt(oPC, "CONV_BERNHARDT_GavePotionGold");
    object oPotion = GetItemPossessedBy(oPC, "ww1_pot_resist");

    if (bQuestActive == TRUE &&
        oPotion != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
