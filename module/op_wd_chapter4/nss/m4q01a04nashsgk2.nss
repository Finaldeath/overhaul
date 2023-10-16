////////Check if Aribeth is alive and has surrendered
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult =   GetIsObjectValid(GetObjectByTag("M4Q1B25_ARIBETH")) &&
                GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER") ==1;


    if (iResult == TRUE && GetTag(OBJECT_SELF) == "M4Q01A04AARI")
    {
        PlayCharacterTheme(53);
    }
    return iResult;
}

