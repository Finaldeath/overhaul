#include "M3PLOTINCLUDE"
#include "NW_i0_plot"

int StartingConditional()
{
int l_iResult;

l_iResult =(CheckIntelligenceLow() &&
            (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTBOUNTYHUNTER") == 1  || HasVaathHead(GetPCSpeaker())));
/////////// OR PLAYER HAS VAATH'S HEAD IN POSSESION
return l_iResult;
}

