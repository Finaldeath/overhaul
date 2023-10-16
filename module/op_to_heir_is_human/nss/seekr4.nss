#include "nw_i0_plot"
void main()
{
    GiveGoldToCreature(GetPCSpeaker(),500);
    RewardXP("Rescue the Heir",100,GetPCSpeaker());
    SetLocalInt(GetModule(),"Heir_Plot",99);
}

