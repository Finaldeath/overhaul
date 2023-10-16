// Kurth is already dead

#include "NW_I0_PLOT"
int StartingConditional()
{
    //object oKurth = GetObjectByTag("Kurth");
    if (GetLocalInt(GetModule(), "NW_2Q4_KURTH_IS_DEAD"))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
