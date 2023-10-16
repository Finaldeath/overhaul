//::///////////////////////////////////////////////
//:: End Narration, Sleeping Man (Condition Script)
//:: H10c_End_Sman4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man finds the
     woman he believes to be his one true love and
     they live happily ever after.

     If the Knower of Names has been ordered to
     go to him and be his love, this also
     qualifies.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bHappy = GetLocalInt(GetModule(), "bSleepingManHappilyEverAfter");
    int bNamesOrdered = GetLocalInt(GetModule(), "bNamesGoToSleepingMan");
    if (bHappy == TRUE ||
        bNamesOrdered == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
