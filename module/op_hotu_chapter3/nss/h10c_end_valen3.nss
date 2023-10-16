//::///////////////////////////////////////////////
//:: End Narration, Valen Romance (Condition Script)
//:: H10c_End_Valen3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Valen was the player's
     romantic interest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oValen = GetObjectByTag("x2_hen_valen");
    int bEndBattle = GetLocalInt(GetModule(), "bValenEndBattle");
    int iRomance = GetLocalInt(GetModule(), "iValenRomance");
    if (bEndBattle == TRUE &&
        iRomance == 2)
    {
        return TRUE;
    }
    return FALSE;
}
