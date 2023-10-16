#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

//THIS IS HANDLED WHEN LYEN JOINS THE PLAYER AS HENCHMAN.
//    AddJournalSingle(s, 7, GetPCSpeaker());

    SetLocked(OBJECT_SELF, FALSE);

    AssignCommand(OBJECT_SELF, ActionOpenDoor(OBJECT_SELF));
}
