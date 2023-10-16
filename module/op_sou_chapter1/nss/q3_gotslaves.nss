// if the PC is aware of the slaves (and they have not been released)
// or if the PC has talked to Glendir (and he is not free)

#include "q3_inc_plot"

int StartingConditional()
{
    int nPlot1 = GetLocalInt(GetPCSpeaker(), "q3_Talked_To_Glendir");
    int nPlot2 = GetLocalInt(GetPCSpeaker(), "q3_PC_Know_Slaves");
    int nPlot = GetPlot("Q3_JOURNAL_GNOLL_SLAVES");
    if(nPlot == 100) // slaves released
        return FALSE;
    if ((nPlot1 == 1) || (nPlot2 == 1))
    {
        return TRUE;
    }
    return FALSE;
}
