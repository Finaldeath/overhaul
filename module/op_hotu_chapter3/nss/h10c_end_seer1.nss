//::///////////////////////////////////////////////
//:: End Narration, PC Betrayed Seer (Condition Script)
//:: H10c_End_Seer1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player betrayed the Seer
     and the Rebel Camp in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "bSeerBetrayed");
    if (bFate == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
