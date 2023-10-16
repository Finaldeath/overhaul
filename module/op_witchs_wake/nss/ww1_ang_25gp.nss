//::///////////////////////////////////////////////
//:: Witch's Wake 1: Angmar, 25 gp (Condition)
//:: WW1_Ang_25gp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 25 gp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);
    if (iGold >= 25)
    {
        return TRUE;
    }
    return FALSE;
}
