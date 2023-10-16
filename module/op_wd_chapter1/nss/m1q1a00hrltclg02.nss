#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(100,GetPCSpeaker()) &&
                     CheckIntelligenceLow();
    return bCondition;
}
