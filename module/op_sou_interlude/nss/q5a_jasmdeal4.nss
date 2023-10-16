// the wine plot is over

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status", 5);
    SetLocalInt(GetModule(), "q5a_Musharak_Wine", 8);
    RewardXP("xphigh", 100, GetPCSpeaker());

    int nPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYQ5_JASMEENA_WINE");
    if (nPlot > 0)
    {
        AddJournalQuestEntry("Q5_JASMEENA_WINE", 30, GetPCSpeaker());
    }
}
