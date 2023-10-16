#include "NW_I0_Plot"
int StartingConditional()
{
  int l_iResult;
  object oHector = GetLocalObject(GetModule(),"oHector104a");
  l_iResult = CheckIntelligenceNormal() &&
              GetIsObjectValid(oHector) &&
              GetIsDead(oHector) == FALSE &&
              GetLocalInt(oHector,"NW_L_M1Q5A07HectorWithPC") &&
 //             GetFactionEqual(oHector,GetPCSpeaker()) &&
              GetObjectSeen(oHector) == FALSE;
  return l_iResult;
}
