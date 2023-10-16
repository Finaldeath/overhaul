#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceLow() &&
                     HasGold(200,GetPCSpeaker());

    return bCondition;
}

