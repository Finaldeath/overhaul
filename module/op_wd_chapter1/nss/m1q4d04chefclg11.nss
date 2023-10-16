#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(100,GetPCSpeaker()) &&
                     CheckIntelligenceNormal();
    return bCondition;
}
