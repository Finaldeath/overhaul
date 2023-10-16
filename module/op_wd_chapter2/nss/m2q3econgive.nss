#include "NW_I0_Plot"
#include "NW_J_FETCH"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(Global(), "NW_J_FETCHPLOT")== 50;
    return iResult;
}
