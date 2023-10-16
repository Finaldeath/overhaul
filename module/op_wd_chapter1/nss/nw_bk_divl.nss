    // **************
    // * Patch 2 Mod
    // * Replace intl script with intl and check class = cleric
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() && GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) > 0;
    return iResult;
}
