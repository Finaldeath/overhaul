//Checks state of plot to properly update journal and to point in the direction
//of Aribeth

#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q1_Begg_1") == 70)
    {
        AddJournalQuestEntry("M1Q1_Begg_1", 80, oPC);
    }
    else
    {
        AddJournalQuestEntry("M1Q1_Begg_1", 60, oPC);
    }
}
