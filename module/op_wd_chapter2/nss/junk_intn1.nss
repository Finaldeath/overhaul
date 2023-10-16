#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() && GetLocalInt(OBJECT_SELF, "Raise") != 1;
	return l_iResult;
}

