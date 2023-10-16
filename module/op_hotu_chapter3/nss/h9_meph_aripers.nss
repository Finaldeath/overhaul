//::///////////////////////////////////////////////
//:: Mephistopheles, Romance Easy Persuade (Condition Script)
//:: H9c_Meph_AriPers.nss
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
#include "nw_i0_plot"

int StartingConditional()
{
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");
    if (iRomance == 2)
    {
        return AutoDC(DC_EASY, SKILL_PERSUADE, GetPCSpeaker());
    }
    return FALSE;
}
