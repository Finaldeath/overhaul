#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q05IDUNGEONKEY")) == FALSE &&
                GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5KnowContest") == 10;
	return l_iResult;
}
