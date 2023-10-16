#include "nw_i0_plot"

int StartingConditional()
{
    object oResc=GetObjectByTag("PrisonerGEN2");
    if (!GetIsObjectValid(oResc))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
