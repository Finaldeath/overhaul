#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_Assa_Plot_Accepted") == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
