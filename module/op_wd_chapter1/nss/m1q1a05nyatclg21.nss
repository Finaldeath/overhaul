#include "NW_I0_Plot"
int StartingConditional()
{
	int bCondition = CheckCharismaNormal() ||
                     GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker()) ||
                     GetLevelByClass(CLASS_TYPE_RANGER,GetPCSpeaker());
	return bCondition;
}
