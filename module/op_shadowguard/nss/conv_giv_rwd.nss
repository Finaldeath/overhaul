#include "help_hench"

void main()
{
    GiveGoldToCreature(GetPCSpeaker(), GetLocalInt(GetPCSpeaker(), GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD"));

    SetLocalInt(OBJECT_SELF, "N_GAVE_REWARD", 1);
}
