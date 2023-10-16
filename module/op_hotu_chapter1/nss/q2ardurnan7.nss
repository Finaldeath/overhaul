#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{

    object oPC = GetPCSpeaker();
    GiveGoldToCreature(oPC,1000);
    //RewardXP("jq2undermountain",70,GetPCSpeaker());


    if (GetPCTotalLevel(oPC) < 15)
    {
        Reward_2daXP(oPC, 12, TRUE); //600 xp reward if PC is less than 15th level
    }
    else
    {
        Reward_2daXP(oPC, 11, TRUE); //200 xp reward if PC is 15th level or higher

    }
}

