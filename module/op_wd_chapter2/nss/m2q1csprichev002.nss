#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetModule(),"M2Q1A00TALKEDMUNG") == 10;
    return iResult;
}
