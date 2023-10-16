//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Entered Steinfaar Mines (Normal Int)
//:: WW1_Hag_Mines_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has entered the
    Steinfaar Mines (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bEnteredMines = GetLocalInt(oPC, "WW1_EnteredMines");

    if (bEnteredMines == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
