#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q01IWARDWANEV")) &&
              CheckCharismaMiddle();
    return iResult;
}
