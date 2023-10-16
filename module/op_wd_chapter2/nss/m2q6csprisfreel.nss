#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                !GetLocked(GetObjectByTag("M2Q06DPORTC02"));
	return l_iResult;
}
