#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone") == FALSE &&
                      CheckIntelligenceLow();
	return bCondition;
}
