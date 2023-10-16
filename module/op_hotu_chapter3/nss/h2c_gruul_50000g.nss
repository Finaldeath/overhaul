//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Player has 50,000 gp (Condition Script)
//:: H2c_Gruul_50000g.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has 50,000 gp
     availableto them.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
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

