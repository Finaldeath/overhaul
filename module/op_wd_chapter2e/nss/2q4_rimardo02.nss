#include "NW_I0_PLOT"

int StartingConditional()
{
    int iGive = GetLocalInt(OBJECT_SELF,"Rimardo_Gave_Items");
    if (iGive == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
