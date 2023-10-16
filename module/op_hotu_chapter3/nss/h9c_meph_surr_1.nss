//::///////////////////////////////////////////////
//:: Mephistopheles, Post-Surrender DoOnce (Condition Script)
//:: H9c_Meph_Surr_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles has
     surrendered and not spoken this line before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bSurrender = GetLocalInt(OBJECT_SELF, "bSurrender");
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bSurrender == TRUE &&
        bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
