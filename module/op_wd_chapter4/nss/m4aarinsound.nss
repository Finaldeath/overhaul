// * plays aarin gend's themes

#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = TRUE;
    if (iResult == TRUE && GetTag(OBJECT_SELF) == "M4Q01A04AARI")
    {
        PlayCharacterTheme(53);
    }

    return iResult;
}
