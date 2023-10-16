#include "NW_I0_Plot"
int StartingConditional()
{
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  int bCondition = GetIsObjectValid(oHector) &&
                            GetIsDead(oHector)  == FALSE &&
                            GetLocalInt(oHector,"NW_L_M1Q5A07HectorWithPC") == TRUE &&
                            GetDistanceToObject(oHector) <= 20.0 &&
                            CheckIntelligenceLow();
  return bCondition;
}


