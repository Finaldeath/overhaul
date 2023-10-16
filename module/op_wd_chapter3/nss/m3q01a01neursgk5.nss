////Check if PC was trial lawyer

#include "mq3trial"

int StartingConditional()
{
    int l_iResult;
    l_iResult = GetLocalObject(GetModule(),"NW_G_M3Q01A01TRIALLAWYER") == GetPCSpeaker();
    return l_iResult;
}

