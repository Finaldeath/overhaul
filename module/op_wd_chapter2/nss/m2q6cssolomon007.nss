#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckCharismaMiddle() &&
              GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") == 1;
    return iResult;
}
