#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S03ICTBADGE01")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S03ICTBADGE02")));
	return l_iResult;
}
