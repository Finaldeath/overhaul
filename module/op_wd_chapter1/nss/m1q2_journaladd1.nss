#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_PrisonBreak")==60)
    {
        AddJournalQuestEntry("m1q2_PrisonBreak", 80, oPC);
    }

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_PrisonBreak")==70)
    {
        AddJournalQuestEntry("m1q2_PrisonBreak", 90, oPC);
    }

}
