//::///////////////////////////////////////////////
//:: Sleeping Man, Dream State 7 (Condition Script)
//:: H3c_SMan_Dream7.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Dream State variable is
     set to 7.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int iDream = GetLocalInt(oMan, "iDreamState");

    if (iDream == 7)
    {
        return TRUE;
    }
    return FALSE;
}
