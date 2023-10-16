#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetHenchmanReaction(oPC, OBJECT_SELF) == FRIENDLY)
        return TRUE;

    return FALSE;
}
