// Action taken for Zidan: update plot to "found Zidan"

#include "x1_inc_plot"
#include "NW_I0_PLOT"
#include "x0_i0_common"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "Q1_TALKED_TO_ZIDAN", 1);
    SetPlot("Q1_JOURNAL_MISSING_GUIDE", 50, GetPCSpeaker());
    SetInterjection(GetPCSpeaker());
}
