////////Player told about job, quest not over yet
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = GetPLocalInt(GetPCSpeaker(),"StarSapphire") ==1 &&
              GetLocalInt(OBJECT_SELF,"StarSapphire") != 99;
    return iResult;
}

