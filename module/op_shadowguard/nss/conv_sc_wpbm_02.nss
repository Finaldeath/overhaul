#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    AddJournalSingle("JT_PREL_LYEN", 3, oPC);
}
