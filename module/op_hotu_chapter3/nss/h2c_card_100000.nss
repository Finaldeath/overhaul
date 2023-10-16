//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Player has 100,000 gp (Condition Script)
//:: H2c_Card_100000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 100,000 gp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);

    if (iGold >= 100000)
    {
        return TRUE;
    }
    return FALSE;
}
