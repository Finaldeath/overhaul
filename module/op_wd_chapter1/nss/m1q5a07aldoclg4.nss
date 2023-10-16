#include "NW_I0_Plot"
int StartingConditional()
{
  int l_iResult;
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  l_iResult =  CheckIntelligenceNormal() &&
               (GetIsObjectValid(oHector) == FALSE ||
               GetIsDead(oHector));
  return l_iResult;
}
