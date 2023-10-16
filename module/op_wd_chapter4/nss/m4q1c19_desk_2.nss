// * if the player has no quill and ink
#include "M4PlotInclude"
int StartingConditional()
{
    int iResult;

    iResult = !GetHasQuillAndInk(GetPCSpeaker());
    return iResult;
}

