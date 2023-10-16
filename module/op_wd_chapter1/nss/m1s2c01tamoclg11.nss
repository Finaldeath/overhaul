#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone") == FALSE &&
                     !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M1S2BroachGiven")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1S2C1Tired") == FALSE &&
                     CheckCharismaLow();
	return bCondition;
}
