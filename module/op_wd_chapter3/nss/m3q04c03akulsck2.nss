#include "NW_I0_PLOT"

int StartingConditional()
{
    if((CheckIntelligenceLow() && CheckCharismaHigh()) ||
    (CheckIntelligenceLow() && GetLocalInt(OBJECT_SELF,"NW_G_M3Q04TALKETIQUETTE")>= 1))
    {
        return TRUE;
    }
    return FALSE;
}

