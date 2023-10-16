#include "help_hench"

void main()
{
    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    object oWP = GetNearestObjectByTag("WP_KARA_EXIT");

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oWP, TRUE));

    DestroyObject(OBJECT_SELF, 4.0);

    DeleteJournalSingle("JT_PREL_KARA", GetPCSpeaker());
}
