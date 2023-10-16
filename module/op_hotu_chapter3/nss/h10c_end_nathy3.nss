//::///////////////////////////////////////////////
//:: End Narration, Nathyrra Romance (Condition Script)
//:: H10c_End_Nathy3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra was the player's
     romantic interest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    int bEndBattle = GetLocalInt(GetModule(), "bNathyrraEndBattle");
    int iRomance = GetLocalInt(GetModule(), "iNathyrraRomance");
    if (bEndBattle == TRUE &&
        iRomance == 2)
    {
        return TRUE;
    }
    return FALSE;
}
