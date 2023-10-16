#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    AddJournalSingle("JT_PREL_LYEN", 4, oPC);

    SetLocalInt(oPC, "N_PREL_SET_UP_LYEN", 1);
}
