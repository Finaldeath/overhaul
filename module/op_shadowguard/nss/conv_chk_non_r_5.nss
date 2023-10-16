// Non random talking for commoner type
#include "help_hench"

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    string s = GetJournalQuest(GetTag(OBJECT_SELF));

    if (GetPCInt(GetPCSpeaker(), s) >= 5)
        return TRUE;

    return FALSE;
}
