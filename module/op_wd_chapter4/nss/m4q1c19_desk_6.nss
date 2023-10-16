// * player is able to write the note
#include "M4PlotInclude"
int StartingConditional()
{
    int iResult;

    iResult = GetHasQuillAndInk(GetPCSpeaker()) && GetLocalInt(GetPCSpeaker(),"NW_L_TALKSPY") == 1;
    return iResult;
}

