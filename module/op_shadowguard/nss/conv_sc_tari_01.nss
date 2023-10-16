// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    int nGold = GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD");

    object oBrooch = GetItemPossessedBy(oPC, "IT_PLOT_003");

    DestroyObject(oBrooch);

    if (nGold == 0)
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 5);

    if (nGold == 200)
        AdjustAlignmentNeutral(oPC, 5);

    if (nGold == 400)
        AdjustAlignmentNeutral(oPC, 5);

    GiveGoldToCreature(oPC, nGold);
}
