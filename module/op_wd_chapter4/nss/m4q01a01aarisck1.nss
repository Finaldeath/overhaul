/////Checks if Gend's initial dialog has been seen by player.
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALKGEND") ==1;
    if (iResult == TRUE && GetTag(OBJECT_SELF) == "M4Q01A04AARI")
    {
        PlayCharacterTheme(53);
    }

    return iResult;
}
