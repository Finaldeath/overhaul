// the 'magic item' will have to be replaced with a legitimate reward
// gives 700 gp and 50% of plot's total XP
// Elaith's final attitude is set to hostile

#include "NW_I0_PLOT"

void main()
{
    DeleteLocalInt(GetPCSpeaker(),"NW_ELAITH_PLOT");
    DeleteLocalInt(GetPCSpeaker(),"Player_Met_Elaith");
    SetLocalInt(OBJECT_SELF,"Elaith_Final_Attitude",2);
    CreateItemOnObject("MAGICITEM",GetPCSpeaker());
    RewardGP(700, GetPCSpeaker());
    RewardXP("m2q1_Gems",100, GetPCSpeaker());
    CreateItemOnObject("NW_IT_MBELT004",GetPCSpeaker(),1);
}
