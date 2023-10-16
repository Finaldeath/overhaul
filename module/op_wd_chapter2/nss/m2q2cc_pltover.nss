//::///////////////////////////////////////////////
//:: m2q2cc_pltover.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If Golem has already given player the key to the first seal.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"M2Q2CC_L" + GetTag(OBJECT_SELF));
    if ((iPlot == 2))
    {
        return TRUE;
    }
    return FALSE;
}

