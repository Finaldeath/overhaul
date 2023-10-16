#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetModule(),"Chapter2_Know_Cult") >= 1;
    return iResult;
}
