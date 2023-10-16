#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetLocalInt(GetModule(),"NW_G_M2Q5Contest") == 0;
	return l_iResult;
}
