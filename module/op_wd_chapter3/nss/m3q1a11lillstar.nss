#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = (HasItem(GetPCSpeaker(),"M3Q1_A11_LIL_STA") && CheckIntelligenceNormal());
    return iResult;
}
