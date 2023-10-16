// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 11, GetPCSpeaker());

    object oWP = GetNearestObjectByTag("WP_EXIT");

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oWP));

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    DestroyObject(OBJECT_SELF, 6.0);
}
