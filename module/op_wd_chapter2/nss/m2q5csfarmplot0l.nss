#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(), "NW_G_LEAH_HOME") == 0 &&
                GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") == 0;

    return l_iResult;
}
