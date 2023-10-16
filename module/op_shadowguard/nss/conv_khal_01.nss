// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 3, oPC);

    CreateItemOnObject("it_plot_002", oPC);
}
