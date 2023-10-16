// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 9, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(oPC, TRUE));

    DestroyObject(OBJECT_SELF, 5.0);
}
