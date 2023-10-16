#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 0)
    {
        return CheckCharismaMiddle();
    }
    return FALSE;
}
