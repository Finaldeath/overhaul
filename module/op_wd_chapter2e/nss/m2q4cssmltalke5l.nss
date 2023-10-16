#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetLocalInt(OBJECT_SELF,"NW_L_SmallTalk") == 5;
	return l_iResult;
}
