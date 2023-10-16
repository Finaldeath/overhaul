#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"2Q4_PlanarToken");
    return iResult;
}
