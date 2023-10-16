#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() && GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") > 0;
	return l_iResult;
}
