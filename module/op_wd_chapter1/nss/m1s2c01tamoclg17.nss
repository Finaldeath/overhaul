#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetLocalObject(OBJECT_SELF,"NW_L_M1S2TheMan") == GetPCSpeaker() &&
                     CheckIntelligenceNormal();
	return bCondition;
}
