#include "help_hench"

// Gets the Journal Entry for this character,
// and checks to see what stage of the quest the player
// is in

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    if (GetLocalInt(GetModule(), "N_INTERLUDE") == 1)
        return TRUE;

    return FALSE;
}
