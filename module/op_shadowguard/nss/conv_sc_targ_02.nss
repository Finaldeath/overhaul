// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 1, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    if (GetPCInt(oPC, "JT_MAIN") > 3)
    {
        AddJournalSingle("JT_MAIN", 6, oPC);
        GiveXPToCreature(oPC, GetJournalQuestExperience("JT_MAIN") / 4);
    }

    else
        AddJournalSingle("JT_MAIN", 5, oPC);
}
