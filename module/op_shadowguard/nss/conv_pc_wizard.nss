#include "help_conv"

int StartingConditional()
{
    if (GetPCClassType(GetPCSpeaker()) != CLASS_TYPE_WIZARD)
        return FALSE;

    return TRUE;
}
