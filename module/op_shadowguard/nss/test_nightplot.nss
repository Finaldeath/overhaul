#include "help_hench"

void main()
{
    object oPC = GetFirstPC();
    AddJournalSingle("JT_PREL_TARI", 12, oPC);
}
