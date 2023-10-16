// Baram is already dead
#include "NW_I0_2Q4LUSKAN"
#include "NW_I0_PLOT"
int StartingConditional()
{
    int iReward = GetLocalInt(OBJECT_SELF, "KNOWS_BARAM_DEAD");
    int nLocal = GetLocalInt(GetModule(), "NW_2Q4_BARAM_IS_DEAD");
    //AssignPCDebugString(IntToString(nLocal));
    if ((nLocal == 1) && (iReward == 0))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
