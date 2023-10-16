///Check if the character has low intelligence and has heard teaser.



#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() && GetLocalInt(GetPCSpeaker(),"HaedralineTeaser") ==1;
}

