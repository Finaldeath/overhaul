//::///////////////////////////////////////////////
//:: The Knower of Names, Player has 100,000 gold (Condition Script)
//:: H7c_Name_100000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player currently has
     100,000 or more gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
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
