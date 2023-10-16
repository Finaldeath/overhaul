#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 0 &&
              CheckCharismaMiddle();
    return iResult;
}
