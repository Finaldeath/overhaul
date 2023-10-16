#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD") == 0)
        return TRUE;

    return FALSE;
}
