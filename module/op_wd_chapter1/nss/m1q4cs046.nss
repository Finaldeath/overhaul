#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetLocalInt(OBJECT_SELF,"NW_L_M1Q4Persuaded") == 0;
	return l_iResult;
}
