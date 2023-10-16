#include "nw_i0_plot"
#include "NW_J_RESCUE"

int StartingConditional()
{
    if ((GetLocalInt(GetPCSpeaker(),"TALK_TO_REVAT")) == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
