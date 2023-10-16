// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"
#include "help_general"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 6, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(oPC));

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    DestroyObject(OBJECT_SELF, 6.0);

    CreateCreatureOnWP("CT_UNIQ_NT_XANT", oPC);
}
