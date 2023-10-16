//* returns true if GetPCSpeaker is valud
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;
    iResult = GetIsObjectValid(GetPCSpeaker());

    // * if morag is using this script then play here theme.
    if (iResult == TRUE)
    {
        PlayCharacterTheme(55);
    }
    return iResult;
}
