// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;
    AddJournalSingle(s, 10, GetPCSpeaker());

    object oWP = GetNearestObjectByTag("WP_ANAG_SPAWN_POINT");
    location lWP = GetLocation(oWP);

    AssignCommand(OBJECT_SELF, ActionForceMoveToLocation(lWP, FALSE, 3.0));
}
