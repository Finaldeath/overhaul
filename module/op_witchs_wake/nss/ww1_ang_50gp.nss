//::///////////////////////////////////////////////
//:: Witch's Wake 1: Angmar, 50 gp (Condition)
//:: WW1_Ang_50gp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 50 gp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);
    if (iGold >= 50)
    {
        return TRUE;
    }
    return FALSE;
}
