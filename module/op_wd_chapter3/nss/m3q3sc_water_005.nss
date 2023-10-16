/// Checks if PC knows of Nax and if Nax still in prison and int normal

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_NaxTalk") >=1 &&
              GetLocalInt(GetModule(),"NW_G_NaxPlot") !=99;

    return iResult;
}
