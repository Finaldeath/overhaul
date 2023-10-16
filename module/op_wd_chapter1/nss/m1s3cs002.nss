#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_AARCL013"));
	return l_iResult;
}
