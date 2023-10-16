//::///////////////////////////////////////////////
//:: End Narration, PC Didn't Betray Seer (Condition Script)
//:: H10c_End_Seer3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player didn't betray the
     Seer and the Rebel Camp in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "bSeerBetrayed");
    if (bFate == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
