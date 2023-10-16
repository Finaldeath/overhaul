//::///////////////////////////////////////////////
//:: End Narration, Nathyrra Romance FORCED(Condition Script)
//:: H10c_End_Nathy3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra was
     FORCED into romance
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: October 20, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    int bEndBattle = GetLocalInt(GetModule(), "bNathyrraEndBattle");
    int iRomance = GetLocalInt(GetModule(), "iNathyrraRomance");
    if (bEndBattle == TRUE &&
        iRomance == 3)
    {
        return TRUE;
    }
    return FALSE;
}

