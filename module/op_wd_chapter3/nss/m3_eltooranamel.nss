//::///////////////////////////////////////////////
//:: M3_ELTOORANAMEL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check Int Low and has not asked name before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow()
        && GetLocalInt(GetPCSpeaker(),"NW_G_ELTOORANAME")==1;
}
