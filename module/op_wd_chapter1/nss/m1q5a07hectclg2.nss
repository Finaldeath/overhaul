#include "NW_I0_Plot"
int StartingConditional()
{
  int l_iResult;

  l_iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetModule(),"NW_G_PlotAldo") >= 10 &&
              GetLocalInt(GetPCSpeaker(),"NW_L_M1Q5A07SpokeToAldo");
  return l_iResult;
}
