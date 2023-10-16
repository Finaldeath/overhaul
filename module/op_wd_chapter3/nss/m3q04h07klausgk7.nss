#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckIntelligenceLow() &&
GetLocalInt(GetModule(), "NW_G_M3Q04PLOTKLAUTH") != 99;
}
