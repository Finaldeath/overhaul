#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                     HasGold(200,GetPCSpeaker());

    return bCondition;
}
