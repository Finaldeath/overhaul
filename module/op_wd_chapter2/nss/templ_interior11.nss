#include "NW_I0_PLOT"

int StartingConditional()
{
    int iReact = GetLocalInt(OBJECT_SELF,"I_AM_FRIENDLY");
    if (iReact == 0)
    {
        return CheckCharismaLow();
    }
    return FALSE;
}
