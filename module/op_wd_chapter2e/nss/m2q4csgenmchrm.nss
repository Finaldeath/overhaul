#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaMiddle() && GetGender(GetPCSpeaker()) == GENDER_MALE;
	return l_iResult;
}
