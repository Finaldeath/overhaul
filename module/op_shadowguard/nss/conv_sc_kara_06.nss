#include "help_hench"

// Gets the Journal Entry for this character,
// and checks to see what stage of the quest the player
// is in

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    string s = "JT_PREL_KARA_2";

    if (GetPCInt(GetPCSpeaker(), s) >= 15)
        return FALSE;

    if (GetLocalInt(GetPCSpeaker(), "N_TOOK_BLOODSTONE") == 0)
        return FALSE;

    return TRUE;
}
