//::///////////////////////////////////////////////
//:: Githzerai Sensei, 2nd-Fold Mystery Lore Check Failed (Condition Script)
//:: H2c_Sens_Lore_2F.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player failed the Lore
     check for the 2nd-Fold Mystery but has
     learned the mystery from some other source.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bLearned = GetLocalInt(GetModule(), "bMystery2Learned");

    if (bLearned == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
