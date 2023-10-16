#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    object oItem = GetItemPossessedBy(oPC, "IT_PLOT_036");

    DestroyObject(oItem);

    int i = GetLocalInt(oPC, "N_ACAD_TEST_BRAZ_LIT");

    i++;

    SetLocalInt(oPC, "N_ACAD_TEST_BRAZ_LIT", i);

    if (i == 1)
        AddJournalSingle("JT_GRAD_CEREMONY", 5, oPC);

    else if (i == 2)
        AddJournalSingle("JT_GRAD_CEREMONY", 6, oPC);

    SetLocalInt(OBJECT_SELF, "N_LIT", 1);

    AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    SetPlaceableIllumination();

    DelayCommand(2.0, RecomputeStaticLighting(GetArea(OBJECT_SELF)));
}
