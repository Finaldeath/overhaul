// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 8, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(oPC));

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    DestroyObject(OBJECT_SELF, 5.0);
}
