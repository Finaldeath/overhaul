//////Check if Haedraline talked to

#include "NW_I0_PLOT"

int StartingConditional()

{

    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M4Q01_HAEDRALINE_TALKEDTO") ==2 &&
              CheckIntelligenceLow();
    return iResult;
}


