#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(200,GetPCSpeaker()) &&
                     CheckIntelligenceNormal();
    return bCondition;
}
