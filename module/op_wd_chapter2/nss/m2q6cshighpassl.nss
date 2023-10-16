#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q04IBARAMPASS")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q04IKURTHPASS")));
	return l_iResult;
}
