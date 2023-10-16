#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(50,GetPCSpeaker()) &&
                     CheckIntelligenceLow();
    return bCondition;
}
