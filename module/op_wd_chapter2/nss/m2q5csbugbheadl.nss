#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q05IBUGBHEAD")) == TRUE;
	return l_iResult;
}
