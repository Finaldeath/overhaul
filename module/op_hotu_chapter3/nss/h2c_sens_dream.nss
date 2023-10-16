//::///////////////////////////////////////////////
//:: Githzerai Sensei, Dreams (Condition Script)
//:: H2c_Sens_Dream.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has resolved the
     Five-Fold Mysteries and has read the dreams
     of the Sleeping Man
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bMysteries = GetLocalInt(GetModule(), "bMysteriesComplete");
    int bDreams = GetLocalInt(GetModule(), "bSawSleepingManDreams");

    if (bMysteries == TRUE &&
        bDreams == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
