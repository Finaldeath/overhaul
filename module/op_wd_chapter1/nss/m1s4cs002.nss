#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IFIGHTPASS"));
	return l_iResult;
}
