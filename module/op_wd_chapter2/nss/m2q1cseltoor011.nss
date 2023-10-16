#include "nw_i0_plot"

int StartingConditional()
{
    return ((CheckIntelligenceLow()) &&
            ((HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC06")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC07")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC08")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC09")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC10")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC11")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC12")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC19")) ||
            (HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC13"))));
}
