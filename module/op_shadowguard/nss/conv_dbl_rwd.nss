#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    int n = GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD");

    SetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD", n * 2);

    SetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD_DOUBLED", 1);
}
