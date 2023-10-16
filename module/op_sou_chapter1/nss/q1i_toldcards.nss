// Katriana has told the PC about the missing cards

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "q1i_Katriana_Job", 1);

    int nPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1bhalfling");
    if (nPlot == 15)
    {
        AddJournalQuestEntry("q1bhalfling", 16, GetPCSpeaker());
    }
}
