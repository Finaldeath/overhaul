#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = DoesPlayerHaveBretsRing(GetPCSpeaker());
    return iResult;
}
