// * player has already taken the note he wrote
#include "M4PlotInclude"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_WRITENOTE") == 3;
    return iResult;
}

