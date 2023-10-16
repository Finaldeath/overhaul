#include "NW_I0_Plot"
int StartingConditional()
{
	return CheckIntelligenceNormal() && GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") < 100;
}
