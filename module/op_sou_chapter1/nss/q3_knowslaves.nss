// the PC has discovered that the slaves exist

#include "q3_inc_plot"

void main()
{
    SetLocalInt(GetPCSpeaker(), "q3_PC_Know_Slaves", 1);
    SetPlot("Q3_JOURNAL_GNOLL_SLAVES", 1, GetPCSpeaker());
}
