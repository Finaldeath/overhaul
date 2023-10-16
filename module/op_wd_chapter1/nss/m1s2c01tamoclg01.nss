#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetLocalInt(OBJECT_SELF,"NW_L_M1S2C1Tired") == FALSE &&
                     CheckIntelligenceNormal();
	return bCondition;
}
