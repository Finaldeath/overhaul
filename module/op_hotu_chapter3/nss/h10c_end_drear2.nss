//::///////////////////////////////////////////////
//:: End Narration, Drearing's Deep - Armand Killed (Condition Script)
//:: H10c_End_Drear2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player killed High Priest
     Armand in Ch2's Drearing's Deep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "bArmandKilled");
    if (bFate == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
