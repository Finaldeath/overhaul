#include "help_general"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetTotalLevel(oPC) < 3)
        return TRUE;

    return FALSE;
}
