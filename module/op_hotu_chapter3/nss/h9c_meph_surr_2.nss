//::///////////////////////////////////////////////
//:: Mephistopheles, Post-Surrender (Condition Script)
//:: H9c_Meph_Surr_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles has
     surrendered.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bSurrender = GetLocalInt(OBJECT_SELF, "bSurrender");
    if (bSurrender == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
