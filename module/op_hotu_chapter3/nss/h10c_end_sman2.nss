//::///////////////////////////////////////////////
//:: End Narration, Sleeping Man (Condition Script)
//:: H10c_End_Sman2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player accepts the
     Sleeping Man's love
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAccepts = GetLocalInt(GetModule(), "bPlayerAcceptsSleepingMansLove");
    if (bAccepts == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
