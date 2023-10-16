#include "NW_I0_Plot"
int StartingConditional()
{
	int l_iResult;

	l_iResult = !CheckCharismaHigh() &&
                 CheckIntelligenceNormal() &&
                  GetRacialType(GetPCSpeaker()) == GetRacialType(OBJECT_SELF);
	return l_iResult;
}
