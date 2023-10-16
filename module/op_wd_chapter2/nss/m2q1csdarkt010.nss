#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_ReadGannonJour") == 1;
    return iResult;
}
