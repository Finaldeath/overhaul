#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = HasGold(400,GetPCSpeaker()) &&
                     CheckIntelligenceLow();
      return bCondition;
}

