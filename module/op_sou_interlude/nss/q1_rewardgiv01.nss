// give the gold reward
// the plot is over

#include "NW_I0_PLOT"
#include "x1_inc_plot"

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward");
    int nGold = 500 + ((nReward - 1) * 100);

    GiveGoldToCreature(GetPCSpeaker(), nGold);
    //RewardXP("xphigh", 100, GetPCSpeaker()); -> removed this line because player already gets 1000 xp for the quest
    SetPlot("Q1_JOURNAL_MISSING_GUIDE", 100, GetPCSpeaker());
}
