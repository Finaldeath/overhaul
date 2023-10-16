#include "NW_I0_PLOT"

int StartingConditional()
{
    int iDone = GetLocalInt(OBJECT_SELF,"Already_Threatened");
    if ((iDone == 0) && (CheckWisdomHigh()))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
