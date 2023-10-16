#include "nw_i0_plot"
#include "NW_J_RESCUE"

int StartingConditional()
{
    if ((GetLocalInt(GetPCSpeaker(),"TALK_TO_REVAT")) == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
