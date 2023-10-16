//::///////////////////////////////////////////////
//:: m2q2cc_pltdone.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     if golem has spoken to the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 24, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"M2Q2CC_L" + GetTag(OBJECT_SELF));
    if ((iPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}

