// Player hasn't found Zidan yet and hasn't talked to Torias

#include "x1_inc_plot"

int StartingConditional()
{
    int nTalk = GetLocalInt(OBJECT_SELF, "q1_Torias_Talked_To");
    int nPlot = GetPlot("Q1_JOURNAL_MISSING_GUIDE");
    if ((nTalk == 0) && (nPlot == 1))
    {
        SetLocalInt(OBJECT_SELF, "q1_Torias_Talked_To", 1);
        return TRUE;
    }
    return FALSE;
}
