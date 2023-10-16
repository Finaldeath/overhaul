#include "NW_I0_PLOT"

int StartingConditional()
{
	return  CheckIntelligenceNormal() && GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q2HighPassLetter"));
}
