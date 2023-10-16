// Katriana action taken: starting water plot

#include "x1_inc_plot"

void main()
{
    SetPlot("Q2_JOURNAL_WATER", 1, GetPCSpeaker());
    SetLocalInt(GetModule(),"X1_KATMUMMY",10);
}
