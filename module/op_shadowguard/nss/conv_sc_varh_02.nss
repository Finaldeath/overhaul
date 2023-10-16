#include "help_hench"

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "IT_PLOT_011");

    DestroyObject(oItem);

    GiveGoldToCreature(GetPCSpeaker(), 300);

    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_EVIL, 10);

    AddJournalSingle("JT_PREL_KARA", 9, GetPCSpeaker());

    GiveXPToCreature(GetPCSpeaker(), GetJournalQuestExperience("JT_PREL_KARA"));

    object oWP = GetNearestObjectByTag("WP_VARH_SPAWN_POINT");
    location lWP = GetLocation(oWP);

    AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP));

    DelayCommand(4.0, AssignCommand(OBJECT_SELF, JumpToLocation(lWP)));
}
