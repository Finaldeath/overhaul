#include "NW_I0_PLOT"

int StartingConditional()
{
    int iAlign = GetAlignmentGoodEvil(GetPCSpeaker());
    if ((iAlign != ALIGNMENT_GOOD) || (CheckCharismaLow()))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
