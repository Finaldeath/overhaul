#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD_DOUBLED") == 1)
        return TRUE;

    return FALSE;
}
