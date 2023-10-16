#include "help_hench"
int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < GetLocalInt(GetPCSpeaker(), GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD"))
        return FALSE;

    return TRUE;
}
