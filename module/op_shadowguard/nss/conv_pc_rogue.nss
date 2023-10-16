#include "help_conv"

int StartingConditional()
{
    if (GetPCClassType(GetPCSpeaker()) != CLASS_TYPE_ROGUE)
        return FALSE;

    return TRUE;
}
