// Kurth is already dead

#include "NW_I0_PLOT"
int StartingConditional()
{
    //object oKurth = GetObjectByTag("Kurth");
    int iReward = GetLocalInt(OBJECT_SELF, "KNOWS_KURTH_DEAD");
    if ((GetLocalInt(GetModule(), "NW_2Q4_KURTH_IS_DEAD")) && (iReward == 0))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
