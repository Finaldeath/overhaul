//::///////////////////////////////////////////////
//:: Witch Wake 1: Nimmermaer, PC Refused Hag
//:: WW1_Nim_NoTarot.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player refused the Night
     Hag's assistance.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bRefusedHag = GetLocalInt(oPC, "CONV_NIGHT_HAG_Refused");

    if (bRefusedHag == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
