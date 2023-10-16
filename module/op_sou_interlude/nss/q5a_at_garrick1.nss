// Garrick directs player to the dig site.

#include "x1_inc_plot"

void main()
{
    SetLocalInt(GetModule(), "Q5_TALKED_TO_GARRICK", 1);
    SetPlot("Q5_JOURNAL_WAY", 10, GetPCSpeaker());
}
