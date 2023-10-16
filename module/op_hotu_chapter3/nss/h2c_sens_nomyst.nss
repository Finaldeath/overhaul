//::///////////////////////////////////////////////
//:: Githzerai Sensei, Mysteries Incomplete (Condition Script)
//:: H2c_Sens_NoMyst.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet
     resolved the Five-Fold Mysteries of the
     Sleeping Man
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bMysteries = GetLocalInt(GetModule(), "bMysteriesComplete");

    if (bMysteries == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

