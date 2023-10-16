//::///////////////////////////////////////////////
//:: Mephistopheles, Player Has Romance With Aribeth (Condition Script)
//:: H9c_Meph_LoveAri.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has finalized the
     romance with Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");
    if (iRomance == 2)
    {
        return TRUE;
    }
    return FALSE;
}
