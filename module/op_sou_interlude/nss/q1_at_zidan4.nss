// Action taken for Zidan: talked to zidan (var used in Katriana's dialog

#include "x1_inc_plot"
#include "x0_i0_common"

void main()
{
    SetLocalInt(GetPCSpeaker(), "Q1_TALKED_TO_ZIDAN", 1);
    SetPlot("Q1_JOURNAL_MISSING_GUIDE", 50, GetPCSpeaker());
    SetInterjection(GetPCSpeaker());
}
