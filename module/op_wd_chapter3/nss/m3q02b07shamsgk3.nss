#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceLow() &&
                (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTBOUNTYHUNTER") < 3
                && !HasHeadOfCommand(GetPCSpeaker()))
                && GetLocalInt(OBJECT_SELF,"NW_G_M3_FEATHER")==0;
            //////// and PC does not have Zokan's head in inventory
    return l_iResult;
}


