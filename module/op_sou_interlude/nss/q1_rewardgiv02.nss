// the plot is over

#include "NW_I0_PLOT"
#include "x1_inc_plot"

void main()
{
    //RewardXP("xphigh", 100, GetPCSpeaker()); // xp is rewarded at the line below
    SetPlot("Q1_JOURNAL_MISSING_GUIDE", 100, GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "q1_Katriana_Reward", 0);
}
