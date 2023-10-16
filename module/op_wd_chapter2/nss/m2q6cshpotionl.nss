#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MPOTION001")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MPOTION002")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MPOTION003")));
	return l_iResult;
}
