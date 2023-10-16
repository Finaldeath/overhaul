#include "help_conv"

int StartingConditional()
{
    if (GetPCClassType(GetPCSpeaker()) != CLASS_TYPE_DRUID)
        return FALSE;

    return TRUE;
}
