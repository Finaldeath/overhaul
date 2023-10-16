// Player hasn't found Zidan yet and has talked to Torias

#include "x1_inc_plot"

int StartingConditional()
{
    int nTalk = GetLocalInt(OBJECT_SELF, "q1_Torias_Talked_To");
    if (nTalk == 1)
    {
        return GetPlot("Q1_JOURNAL_MISSING_GUIDE") == 1;
    }
    return FALSE;
}
