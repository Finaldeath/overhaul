//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Player has 30,000 gp (Condition Script)
//:: H2c_Gruul_30000g.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has 30,000 gp
     available to them.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);

    if (iGold >= 30000)
    {
        return TRUE;
    }
    return FALSE;
}
