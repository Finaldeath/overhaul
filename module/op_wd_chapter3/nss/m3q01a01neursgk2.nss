
#include "mq3trial"

int StartingConditional()
{
    int l_iResult;
    l_iResult = GetLocalInt(OBJECT_SELF,"NW_G_M3Q1_TRIAL_COMPLETE")==TRUE
        && GetLocalObject(GetModule(),"NW_G_M3Q01A01TRIALLAWYER") == GetPCSpeaker()
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1TRIAL_XP")==0;
    return l_iResult;
}
