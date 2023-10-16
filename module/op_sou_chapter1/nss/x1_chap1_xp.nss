//x1_chap1_xp

//Reward 2000 xp for ending the chapter (once only
#include "nw_i0_plot"
void main()
{
    if (GetLocalInt(GetModule(), "X1_Chapter1Reward") != 1)
    {
        SetLocalInt(GetModule(), "X1_Chapter1Reward", 1);
        object oPC = GetPCSpeaker();
        RewardXP("xpvhigh", 100, oPC);
    }

}
