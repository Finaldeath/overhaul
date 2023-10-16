////////Trial over
#include "mq3trial"

int StartingConditional()
{
    int l_iResult;
    l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") >= 2;
    return l_iResult;
}

