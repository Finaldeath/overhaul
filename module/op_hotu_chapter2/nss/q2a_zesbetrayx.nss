///Sets zesyyr variable marking here as betrayed
///Remove Zesyyr from the city
///Add heads on stake for Zesyyr and her guards

#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(),"Zesyyr_Betray",TRUE);

    //Give PC Reward (amulet of will + 8)
    if (GetLocalInt(OBJECT_SELF, "nGiveFirstReward") == 1)
        return;

    object oPC = GetPCSpeaker();
    SetLocalInt(OBJECT_SELF, "nGiveFirstReward", 1);
    CreateItemOnObject("x2_it_mneck018", oPC);

    //XP reward for Evil PCs
    if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
        Reward_2daXP(oPC, 52);
}
