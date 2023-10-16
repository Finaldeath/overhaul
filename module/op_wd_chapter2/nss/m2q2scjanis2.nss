#include "nw_i0_plot"
#include "NW_J_RESCUE"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_G_Resc_Plot") == 10)
    {
        return TRUE;
    }
    return FALSE;
}
