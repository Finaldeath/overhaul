//::///////////////////////////////////////////////
//:: End Narration, Valen Romance FORCED(Condition Script)
//:: H10c_End_Valen5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Valen was
     FORCED into romance
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: October 20, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_valen");
    int bEndBattle = GetLocalInt(GetModule(), "bValenEndBattle");
    int iRomance = GetLocalInt(GetModule(), "iValenRomance");
    if (bEndBattle == TRUE &&
        iRomance == 3)
    {
        return TRUE;
    }
    return FALSE;
}


