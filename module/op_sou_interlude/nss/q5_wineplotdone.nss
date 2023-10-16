// the wine plot is done, give XP

#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(GetModule(), "q5a_Musharak_Wine", 8);
    RewardXP("xphigh", 100, GetPCSpeaker());

    int nPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYQ5_JASMEENA_WINE");
    if (nPlot > 0)
    {
        AddJournalQuestEntry("Q5_JASMEENA_WINE", 40, GetPCSpeaker());
    }
}
