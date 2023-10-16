#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD", 0);
}
