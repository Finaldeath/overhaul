//::///////////////////////////////////////////////
//:: Check Intelligence Low
//:: m2q2_HurtSpiritL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a low intelligence
    and the woods have not been freed.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() &&
           GetLocalInt(GetModule(),"NW_M2Q2E_WoodsFreed") == 0;
}
