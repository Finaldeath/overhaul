#include "NW_I0_PLOT"

int StartingConditional()
{
	return  CheckIntelligenceLow() && GetLocalInt(GetModule(),"M2Q1AribethGone") == 1;
}

