//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Player's Deathcount = 2
//:: WW1_Hag_Death2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has died twice
     while under her care.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iDeaths = GetLocalInt(oPC, "iDeaths");

    if (iDeaths == 2)
    {
        return TRUE;
    }
    return FALSE;
}
