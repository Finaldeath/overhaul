#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q04IBARAMPASS")) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q04IKURTHPASS")) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q06IAARINPASS"));
	return l_iResult;
}
