#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q05IDUNGEONKEY")) == FALSE;
	return l_iResult;
}
