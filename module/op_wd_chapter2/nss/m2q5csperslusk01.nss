#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_L_PersuadeGuard");
    if (l_iResult == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
