#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckIntelligenceLow() && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2ITMIRRORVAN"));
}
