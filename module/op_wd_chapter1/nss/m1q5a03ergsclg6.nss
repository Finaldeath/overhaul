#include "NW_I0_Plot"
int StartingConditional()
{
  int bCondition = GetLocalInt(GetModule(),"NW_L_WaltersReturned") == FALSE &&
                   GetLocalInt(GetModule(),"NW_G_M1Q5WaltersNowDead") == FALSE &&
                   CheckIntelligenceLow();
  return bCondition;
}
