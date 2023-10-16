//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Player has 50,000 gp (Condition Script)
//:: H2c_Card_50000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 50,000 gp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);

    if (iGold >= 50000)
    {
        return TRUE;
    }
    return FALSE;
}
