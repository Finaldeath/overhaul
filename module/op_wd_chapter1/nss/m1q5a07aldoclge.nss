#include "NW_I0_Plot"
int StartingConditional()
{
  int l_iResult;
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  l_iResult =  CheckIntelligenceLow() &&
               GetIsObjectValid(oHector) &&
               !GetIsDead(oHector) &&
               GetLocalInt(oHector,"NW_L_M1Q5A07HectorWithPC") &&
//               GetFactionEqual(oHector,GetLastSpeaker()) &&
               GetObjectSeen(oHector) == FALSE;
  return l_iResult;
}
