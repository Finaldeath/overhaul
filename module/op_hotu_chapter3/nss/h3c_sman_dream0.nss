//::///////////////////////////////////////////////
//:: Sleeping Man, Dream State 0 (Condition Script)
//:: H3c_SMan_Dream0.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Dream State variable is
     set to 0.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int iDream = GetLocalInt(oMan, "iDreamState");

    if (iDream == 0)
    {
        return TRUE;
    }
    return FALSE;
}
