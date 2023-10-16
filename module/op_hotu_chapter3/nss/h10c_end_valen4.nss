//::///////////////////////////////////////////////
//:: End Narration, Valen (Condition Script)
//:: H10c_End_Valen4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Valen participated in the
     final battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oValen = GetObjectByTag("x2_hen_valen");
    int bEndBattle = GetLocalInt(GetModule(), "bValenEndBattle");
    if (bEndBattle == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
