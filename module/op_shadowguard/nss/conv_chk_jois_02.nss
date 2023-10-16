#include "help_hench"

// Gets the Journal Entry for this character,
// and checks to see what stage of the quest the player
// is in

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    string s = GetJournalQuest(GetTag(OBJECT_SELF));
    object oPC = GetPCSpeaker();

    if ((GetPCInt(oPC, s) == 2) || (GetLocalInt(oPC, "N_GOT_IRIL_CRYS") == TRUE))
    {
        return TRUE;
    }

    return FALSE;
}
