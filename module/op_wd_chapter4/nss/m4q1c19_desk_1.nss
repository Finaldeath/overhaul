// * if the player has quill and ink but the local = 0 the trigger will say
#include "M4PlotInclude"
int StartingConditional()
{
    int iResult;

    iResult = GetHasQuillAndInk(GetPCSpeaker()) && GetLocalInt(GetPCSpeaker(), "NW_L_TALKSPY") == 0;
    return iResult;
}
