//::///////////////////////////////////////////////
//:: End Narration, Deekin (Condition Script)
//:: H10c_End_Deekin4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Deekin participated in the
     final battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    int bEndBattle = GetLocalInt(GetModule(), "bDeekinEndBattle");
    if (bEndBattle == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
