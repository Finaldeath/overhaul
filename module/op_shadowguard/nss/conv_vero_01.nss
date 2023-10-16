// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 6, GetPCSpeaker());

    object oWP = GetNearestObjectByTag("WP_EXIT");

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oWP));

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    object oMarkius = GetNearestObjectByTag("HENCH_MARK");

    AssignCommand(oMarkius, ActionMoveToObject(oWP));

    SetLocalInt(oMarkius, "N_DONT_SPEAK", 1);

    HenchmanReturn(oMarkius);

    DestroyObject(OBJECT_SELF, 4.0);
}
