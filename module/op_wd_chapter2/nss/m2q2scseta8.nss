#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckIntelligenceLow() && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITGEMSETARA"));
}
