//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Entered Myrkwood (Low Int)
//:: WW1_Hag_Myrk_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has entered the
    Myrkwood (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bMyrkEntered = GetLocalInt(oPC, "XP_EX_Myrkwood");

    if (bMyrkEntered == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
