//::///////////////////////////////////////////////
//:: Check Intelligence Normal
//:: m2q2_HurtSpiritN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a normal intelligence
    and the woods have not been freed.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
           GetLocalInt(GetModule(),"NW_M2Q2E_WoodsFreed") == 0;
}
