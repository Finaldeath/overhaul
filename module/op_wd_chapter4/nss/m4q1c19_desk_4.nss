// * player wrote note and then died
//* player has to leave and die once before the plot can progress
#include "M4PlotInclude"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_WRITENOTE") == 2;
    return iResult;
}

