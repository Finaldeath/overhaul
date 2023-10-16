//::///////////////////////////////////////////////
//:: Check Intelligence Low, Has Fixed Sword


#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_FIXEDAGES"));
}

