#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() && GetLocalInt(OBJECT_SELF,"NW_L_PCShowKindness") == 10;
	return l_iResult;
}
