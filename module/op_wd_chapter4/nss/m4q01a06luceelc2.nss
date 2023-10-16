/////Set local on PC to status reward given, award XP

#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetPCSpeaker(), "NW_G_M4Q01PLOTLEESA_RESCUE",3);
    SetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE",2);
    RewardXP("NW_LUCE_LEESA",100,GetPCSpeaker());
}
