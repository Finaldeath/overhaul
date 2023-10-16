#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_Theft_Plot") == 0)
    {
        if (GetLocalInt(GetPCSpeaker(),"NW_Theft_Plot_Accepted") == 0)
        {
            return CheckCharismaLow();
        }
    }
    return FALSE;
}
