#include "NW_I0_PLOT"

int StartingConditional()
{
    if((CheckIntelligenceNormal() && CheckCharismaHigh()) ||
    (CheckIntelligenceNormal() && GetLocalInt(OBJECT_SELF,"NW_G_M3Q04TALKETIQUETTE")>= 1))
    {
        return TRUE;
    }
    return FALSE;
}
