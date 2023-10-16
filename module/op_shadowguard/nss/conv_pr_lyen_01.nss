#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    AddJournalSingle("JT_PREL_LYEN", 5, oPC);

    int nGold = GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD");

    if (nGold == 0 && GetLocalInt(oPC, "N_PREL_SET_UP_LYEN") == 0)
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 5);

    else if (nGold == 200)
        AdjustAlignmentNeutral(oPC, 5);
}
