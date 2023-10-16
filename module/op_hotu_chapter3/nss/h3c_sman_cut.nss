//::///////////////////////////////////////////////
//:: Sleeping Man, PC Cut Him (Condition Script)
//:: H3c_SMan_Cut.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player woke the Sleeping
     Man by cutting him.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bCut = GetLocalInt(oMan, "bPlayerCutMe");
    if (bCut == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
