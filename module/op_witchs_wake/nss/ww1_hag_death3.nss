//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Player's Deathcount = 3
//:: WW1_Hag_Death3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has died three
     times while under her care.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iDeaths = GetLocalInt(oPC, "iDeaths");

    if (iDeaths == 3)
    {
        return TRUE;
    }
    return FALSE;
}
