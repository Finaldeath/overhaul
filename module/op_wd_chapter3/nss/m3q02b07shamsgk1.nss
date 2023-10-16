#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int l_iResult;

    l_iResult = (CheckIntelligenceLow() &&
                (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTBOUNTYHUNTER") > 2 || HasHeadOfCommand(GetPCSpeaker()) ));
            //////// OR PC has Zokan's head in inventory
    return l_iResult;
}

