//::///////////////////////////////////////////////
//:: Check Intelligence Normal, Has Broken Sword


#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_BROKENAGES"));
}

