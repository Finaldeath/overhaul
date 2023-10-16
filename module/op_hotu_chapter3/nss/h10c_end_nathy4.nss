//::///////////////////////////////////////////////
//:: End Narration, Nathyrra (Condition Script)
//:: H10c_End_Nathy4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra participated in the
     final battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    int bEndBattle = GetLocalInt(GetModule(), "bNathyrraEndBattle");
    if (bEndBattle == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
