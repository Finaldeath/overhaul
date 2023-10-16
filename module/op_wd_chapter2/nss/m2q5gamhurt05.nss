// PC has a healing potion

#include "NW_I0_PLOT"
int StartingConditional()
{
    if ((HasItem(GetPCSpeaker(),"NW_IT_MPOTION001")) ||
        (HasItem(GetPCSpeaker(),"NW_IT_MPOTION002")) ||
        (HasItem(GetPCSpeaker(),"NW_IT_MPOTION020")) ||
        (HasItem(GetPCSpeaker(),"NW_IT_MPOTION003")))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
