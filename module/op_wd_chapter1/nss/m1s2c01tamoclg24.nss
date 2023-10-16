#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = GetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone") == FALSE &&
                     GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Broach"))&&
                      CheckIntelligenceLow();
	return bCondition;
}
