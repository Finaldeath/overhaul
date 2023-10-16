// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 4, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    object oItem = GetItemPossessedBy(oPC, "IT_PLOT_004");



    DestroyObject(oItem);

    int nGold = GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD");

    if (GetLocalInt(oItem, "N_MODIFIED") == 1)
    {
        AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 5);
        AddJournalSingle(s, 5, oPC);
    }

    if (nGold == 0)
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 5);

    else if (nGold >= 150)
        AdjustAlignmentNeutral(oPC, 5);

    GiveGoldToCreature(oPC, nGold);

    int nXP = GetJournalQuestExperience(s);

    GiveXPToCreature(oPC, nXP);
}
