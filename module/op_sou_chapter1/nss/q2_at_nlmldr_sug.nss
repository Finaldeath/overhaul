// Advance Kobolds plot and marked global as talked to quest giver

#include "q2_inc_plot"

void main()
{
    SetPlot("Q2_JOURNAL_KOBOLDS", 10, GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "Q2_TALKED_TO_NILMALDOR", 1);
}
