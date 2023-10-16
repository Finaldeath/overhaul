// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"
#include "help_general"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 3, GetPCSpeaker());

    object oPC = GetPCSpeaker();

    object oAlia = GetNearestObjectByTag("CT_UNIQ_SH_ALIA", oPC);

    if (GetLocalInt(oAlia, "N_SPOKE_WITH_PC") == 0)
    {
        SceneSpeak(oAlia, "Excuse me, " + GetName(oPC) + ", but might I have a word with you for a moment?");

        SetLocalInt(oAlia, "N_SPOKE_WITH_PC", 1);
    }
}
