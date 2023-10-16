//::///////////////////////////////////////////////
//:: Mephistopheles, Not Yet Surrendered (Condition Script)
//:: H9c_Meph_NoSurr.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles has not yet
     surrendered.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bSurrender = GetLocalInt(OBJECT_SELF, "bSurrender");
    if (bSurrender == FALSE)
    {
        // Set for Meph cutscene.
        SetLocalInt(GetModule(), "HX_END_BATTLE_TALKED_2", TRUE);
        return TRUE;
    }
    return FALSE;
}
