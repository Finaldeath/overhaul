// Evaine is dead, intelligence normal

#include "nw_i0_plot"

int StartingConditional()
{
    /*object oResc = GetObjectByTag("M2Q05CEVAINE");
    if (!GetIsObjectValid(oResc))
    {
        return CheckIntelligenceNormal();
    }
    */
    int nDead = GetLocalInt(GetModule(), "NW_2Q4_EVAINE_DEAD");
    if(nDead == 10)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
