#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iResult == 5)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
