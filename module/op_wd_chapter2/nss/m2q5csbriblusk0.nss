#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_BribeGuard");
    if (l_iResult == 0)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
