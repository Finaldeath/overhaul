// Non random talking for commoner type
#include "help_conv"

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    if (GetLocalInt(OBJECT_SELF, "N_DONT_RAND") == 0)
        return FALSE;

    return TRUE;
}
