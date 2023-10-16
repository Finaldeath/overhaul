//::///////////////////////////////////////////////
//:: The Knower of Names, Player has 500,000 gold (Condition Script)
//:: H7c_Name_500000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player currently has
     500,000 or more gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);
    if (iGold >= 500000)
    {
        return TRUE;
    }
    return FALSE;
}
