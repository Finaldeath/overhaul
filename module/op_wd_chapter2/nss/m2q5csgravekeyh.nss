#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckCharismaHigh() &&
                GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q05IGRAVEKEY")) == TRUE;
	return l_iResult;
}
