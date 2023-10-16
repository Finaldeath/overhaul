#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;
    object oSpeaker = GetLastSpeaker();

	l_iResult = CheckIntelligenceLow() &&
                (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL01")) ||
                GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL02")) ||
                GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL03")));
	return l_iResult;
}
