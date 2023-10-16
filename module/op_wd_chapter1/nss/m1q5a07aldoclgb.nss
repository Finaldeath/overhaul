#include "NW_I0_Plot"
int StartingConditional()
{
  int l_iResult;
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  l_iResult =  CheckIntelligenceNormal() &&
               GetLocalInt(GetModule(),"NW_G_PlotAldo") > 10 &&
               GetIsObjectValid(oHector) &&
               !GetIsDead(oHector) &&
               GetFactionEqual(oHector,GetLastSpeaker()) &&
               GetDistanceToObject(oHector) > 20.0;
  return l_iResult;
}
