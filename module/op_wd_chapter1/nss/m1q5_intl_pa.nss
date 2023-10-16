#include "NW_I0_Plot"
int StartingConditional()
{
	return CheckIntelligenceLow() && GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") < 100;
}
