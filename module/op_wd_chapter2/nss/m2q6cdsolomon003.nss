#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckCharismaLow() &&
              GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(GetModule(),"NW_G_M2Q6Solomon") == 0;
    return iResult;
}
