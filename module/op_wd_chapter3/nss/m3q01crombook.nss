// * Normal IQ. Checks to see if player already has the book
// * if so this option does not appear
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "m3barunbook")) == FALSE;
    return iResult;
}
