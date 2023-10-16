//::///////////////////////////////////////////////
//:: M3_ELTOORANAMEN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check Int Normal and has not ask name before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal()
        && GetLocalInt(GetPCSpeaker(),"NW_G_ELTOORANAME")==1;
}
