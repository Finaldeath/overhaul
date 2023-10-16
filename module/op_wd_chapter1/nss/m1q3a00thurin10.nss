#include "nw_i0_plot"

int StartingConditional()
{
    object oResc=GetObjectByTag("M1Q3APRISON");
    if (!GetIsObjectValid(oResc))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
