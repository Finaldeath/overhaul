// Evaine is dead, intelligence low

#include "nw_i0_plot"

int StartingConditional()
{
    /*
    object oResc = GetObjectByTag("M2Q05CEVAINE");
    if (!GetIsObjectValid(oResc))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
    */
    int nDead = GetLocalInt(GetModule(), "NW_2Q4_EVAINE_DEAD");
    if(nDead == 10)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
