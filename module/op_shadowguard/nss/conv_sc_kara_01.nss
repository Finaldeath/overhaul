// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 4, GetPCSpeaker());

    object oDoor = GetNearestObjectByTag("DOOR_012_0_0");

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oDoor));

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    DestroyObject(OBJECT_SELF, 4.0);
}
