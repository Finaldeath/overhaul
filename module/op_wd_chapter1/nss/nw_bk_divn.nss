    // **************
    // * Patch 2 Mod
    // * Replace intn script with intn and check class = cleric
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) > 0;
    return iResult;
}
