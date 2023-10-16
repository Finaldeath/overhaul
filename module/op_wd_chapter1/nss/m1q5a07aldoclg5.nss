#include "NW_I0_Plot"
int StartingConditional()
{
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  int bCondition = GetLocalInt(GetModule(),"NW_G_PlotAldo") > 15 &&
                   CheckIntelligenceNormal() &&
                   GetIsObjectValid(oHector) &&
                   GetIsDead(oHector)  == FALSE &&
                   GetLocalInt(oHector,"NW_L_M1Q5A07HectorWithPC") == FALSE;
  return bCondition;
  }
