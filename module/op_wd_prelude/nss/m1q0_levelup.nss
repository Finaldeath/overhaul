#include "nw_i0_plot"

void main()
{
    object oPC = GetPCLevellingUp();

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYJOUR_M1Q0Training")==50)
    {
        AddJournalQuestEntry("JOUR_M1Q0Training", 60, oPC);
    }
}

