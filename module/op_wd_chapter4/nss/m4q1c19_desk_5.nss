// * player wrote the note (plot won't progress, i.e., go to 2 until player leaves and comes back
#include "M4PlotInclude"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_WRITENOTE") == 1;
    return iResult;
}

