#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_Assa_Plot") == 0)
    {
        if (GetLocalInt(GetPCSpeaker(),"NW_Assa_Plot_Accepted") == 1)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
