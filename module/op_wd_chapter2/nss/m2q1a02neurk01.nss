#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((!HasItem(GetPCSpeaker(),"M2Q1ITRING01")) &&
        (!HasItem(GetPCSpeaker(),"M2Q1ITRING02")) &&
        (!HasItem(GetPCSpeaker(),"M2Q1ITRING03")))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
