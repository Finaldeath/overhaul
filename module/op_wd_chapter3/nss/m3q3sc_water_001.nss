//*  Normal Intelligence, Two Fire Elemental Braziers are still up

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_01")) == TRUE
            && GetIsObjectValid(GetObjectByTag("M3Q3B_FIRE_SPAWN_02")) == TRUE;
}

