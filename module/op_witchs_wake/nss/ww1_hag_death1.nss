//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Player's Deathcount <= 1
//:: WW1_Hag_Death1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has died once (or
     less if there's been DM intervention) while
     under her care.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iDeaths = GetLocalInt(oPC, "iDeaths");

    if (iDeaths <= 1)
    {
        return TRUE;
    }
    return FALSE;
}
