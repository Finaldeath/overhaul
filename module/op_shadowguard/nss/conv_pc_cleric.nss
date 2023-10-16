#include "help_conv"

int StartingConditional()
{
    if (GetPCClassType(GetPCSpeaker()) != CLASS_TYPE_CLERIC)
        return FALSE;

    return TRUE;
}
