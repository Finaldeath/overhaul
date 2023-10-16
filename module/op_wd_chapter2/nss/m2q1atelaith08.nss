// increases the global that tracks the number of gems that have been brought back
// gives 200 gp to the player and awards 25% of the plot's total XP

#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(OBJECT_SELF,"Num_Gems_Returned",GetLocalInt(OBJECT_SELF,"Num_Gems_Returned") + 1);
    RewardGP(200,GetPCSpeaker(),FALSE);
    RewardXP("m2q1_Gems",100, GetPCSpeaker());
}
