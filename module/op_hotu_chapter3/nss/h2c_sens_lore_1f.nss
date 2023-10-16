//::///////////////////////////////////////////////
//:: Githzerai Sensei, 1st-Fold Mystery Lore Check Failed (Condition Script)
//:: H2c_Sens_Lore1F.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player failed the Lore
     check for the 1st-Fold Mystery but has
     learned the mystery from some other source.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bLearned = GetLocalInt(GetModule(), "bMystery1Learned");

    if (bLearned == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
