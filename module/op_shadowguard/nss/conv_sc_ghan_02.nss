// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 2, GetPCSpeaker());

    object oGhan = GetNearestObjectByTag("CT_UNIQ_NT_GHAN");

    object oWP = GetNearestObjectByTag("WP_GHAN_WALK_TO", OBJECT_SELF);

    AssignCommand(oGhan, ActionMoveToObject(oWP));
}
