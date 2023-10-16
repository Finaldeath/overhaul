#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(1,GetPCSpeaker()) &&
                     CheckIntelligenceNormal();
    return bCondition;
}
