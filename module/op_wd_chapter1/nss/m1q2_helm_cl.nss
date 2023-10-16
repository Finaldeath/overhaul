#include "nw_i0_plot"

int StartingConditional()
{
    if (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"Evil")) &&
        GetLocalObject(OBJECT_SELF,"Evil") == GetPCSpeaker())
    {
        return FALSE;
    }
    return CheckCharismaLow();
}

