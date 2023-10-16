// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 6, GetPCSpeaker());

    SetLocalInt(OBJECT_SELF, "N_GATE_ACTIVATED", 0);

    SetLocalInt(GetModule(), "N_ST_1_HARK_FREED", 1);
}
