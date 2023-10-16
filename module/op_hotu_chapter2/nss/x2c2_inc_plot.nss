// plot inlude file: set and get plot status

// Sets the journal sPlotTag to nState, and sets a module var with the plot status.
// The plots is alwats set for all players.
void SetPlot(string sPlotTag, int nState);

// Gets the current plot status for sPlotTag
int GetPlot(string sPlotTag);

void SetPlot(string sPlotTag, int nState)
{
    AddJournalQuestEntry(sPlotTag, nState, GetFirstPC(), TRUE, TRUE);
    SetLocalInt(GetModule(), sPlotTag, nState);
}

int GetPlot(string sPlotTag)
{
    return GetLocalInt(GetModule(), sPlotTag);
}
