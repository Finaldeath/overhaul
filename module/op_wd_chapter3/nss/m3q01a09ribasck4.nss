////////Player accepted or heard about job, quest over, int normal

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetPLocalInt(GetPCSpeaker(),"StarSapphire") >=1 &&
              GetLocalInt(OBJECT_SELF,"StarSapphire") == 99;
    return iResult;
}

