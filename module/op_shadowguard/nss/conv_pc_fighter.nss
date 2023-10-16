#include "help_conv"

int StartingConditional()
{
    if (GetPCClassType(GetPCSpeaker()) != CLASS_TYPE_FIGHTER)
        return FALSE;

    return TRUE;
}
