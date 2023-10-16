#include "NW_I0_Plot"
int StartingConditional()
{
    return GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMAN &&
           GetLocalInt(OBJECT_SELF,"NW_L_RaceCard") == FALSE &&
           CheckIntelligenceNormal();
}
