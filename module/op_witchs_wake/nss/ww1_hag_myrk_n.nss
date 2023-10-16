//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Entered Myrkwood (Normal Int)
//:: WW1_Hag_Myrk_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has entered the
    Myrkwood (Normal Int)
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
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
