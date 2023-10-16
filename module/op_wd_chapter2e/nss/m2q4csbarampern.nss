#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() && GetLocalInt(OBJECT_SELF,"NW_L_TriedPersuade") == 0;
	return l_iResult;
}
