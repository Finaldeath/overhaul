//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Player's Deathcount = 4
//:: WW1_Hag_Death4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has died four
     times while under her care (ie: has entered
     Stygia and escaped with help from a DM or
     fellow player).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iDeaths = GetLocalInt(oPC, "iDeaths");

    if (iDeaths == 4)
    {
        return TRUE;
    }
    return FALSE;
}
