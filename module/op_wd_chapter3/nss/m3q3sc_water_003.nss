//*  Normal Intelligence, one of the Fire Elemental Braziers is still up

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && (GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_01")) == FALSE
            || GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_02")) == FALSE);
}
