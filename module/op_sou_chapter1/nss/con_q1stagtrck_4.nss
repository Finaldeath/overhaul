#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (CheckIntelligenceHigh() == TRUE && GetLocalInt(oPC, "X1_nBlinkStagChance") < 60)
        return TRUE;
    return FALSE;
}
