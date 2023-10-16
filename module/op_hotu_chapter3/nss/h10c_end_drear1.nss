//::///////////////////////////////////////////////
//:: End Narration, Drearing's Deep - Dracolich Killed (Condition Script)
//:: H10c_End_Drear1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player killed the
     Dracolich in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "bDracolichKilled");
    if (bFate == TRUE)
    {
        return TRUE;
    }
    return FALSE;

}
