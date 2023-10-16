#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = !HasItem(GetPCSpeaker(),"Elynwyd_Ring");
    return iResult;
}
