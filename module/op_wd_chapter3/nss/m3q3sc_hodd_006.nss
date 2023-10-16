//::///////////////////////////////////////////////
//:: Check Intelligence Normal, Has Fixed Sword


#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_FIXEDAGES"));
}
