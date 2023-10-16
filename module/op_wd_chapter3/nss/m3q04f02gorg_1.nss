// * She takes Klauths head from player and gives reward

#include "m3plotinclude"
#include "nw_i0_plot"
void main()
{
    TakeKlauthsHead(GetPCSpeaker());
    RewardXP("M3Q04_F02_GORG",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q4F_KLAUTHHEADGIVEN",1);
}
