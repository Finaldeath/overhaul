#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q05iZHENTVKEY")) == FALSE;
	return l_iResult;
}
