// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 3, GetPCSpeaker());

    object oDoor = GetNearestObjectByTag("DOOR_011_1_0");

    SetLocked(oDoor, FALSE);
}
