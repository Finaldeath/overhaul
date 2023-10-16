////Check if the character has normal intelligence and has heard teaser.


#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && GetLocalInt(GetPCSpeaker(),"HaedralineTeaser") ==1;
}

