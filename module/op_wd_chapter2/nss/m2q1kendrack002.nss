//* None of Yesgar's followers (Zor, Stirge, Delilah, and Wyvern)
//* still has an ear.
#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_TookZorEar") == 10 &&
                GetLocalInt(GetModule(),"NW_G_TookStirgeEar") == 10 &&
                GetLocalInt(GetModule(),"NW_G_TookWyvernEar") == 10 &&
                GetLocalInt(GetModule(),"NW_G_TookDelilahEar") == 10;
    return l_iResult;
}
