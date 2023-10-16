// start dialog

#include "x1_inc_plot"

void main()
{
    if(GetPlot("Q1_JOURNAL_MISSING_GUIDE") > 0)
        ActionStartConversation(GetLastUsedBy());
    else
        AssignCommand(GetLastUsedBy(), SpeakOneLinerConversation("q1_hole2"));
}
