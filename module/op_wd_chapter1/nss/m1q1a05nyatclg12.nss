#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1 &&
                     CheckIntelligenceLow();

	return bCondition;
}
