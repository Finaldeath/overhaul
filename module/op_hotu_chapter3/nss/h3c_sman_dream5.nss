//::///////////////////////////////////////////////
//:: Sleeping Man, Dream State 5 (Condition Script)
//:: H3c_SMan_Dream5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Dream State variable is
     set to 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int iDream = GetLocalInt(oMan, "iDreamState");

    if (iDream == 5)
    {
        return TRUE;
    }
    return FALSE;
}
