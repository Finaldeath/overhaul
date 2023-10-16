#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC") == GetPCSpeaker() &&
                GetLocalInt(OBJECT_SELF,"NW_L_Reward") == 0;
	return l_iResult;
}
