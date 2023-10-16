//* At least one of Yesgar's followers (Zor, Stirge, Delilah, and Wyvern)
//* still has an ear. Medium Charisma
#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckCharismaMiddle() &&
               (GetLocalInt(GetModule(),"NW_G_TookZorEar") == 0 ||
                GetLocalInt(GetModule(),"NW_G_TookStirgeEar") == 0 ||
                GetLocalInt(GetModule(),"NW_G_TookWyvernEar") == 0 ||
                GetLocalInt(GetModule(),"NW_G_TookDelilahEar") == 0);
    return l_iResult;
}

