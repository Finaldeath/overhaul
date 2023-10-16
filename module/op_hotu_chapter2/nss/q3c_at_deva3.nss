// Deva join with player

#include "nw_i0_plot"
#include "x2c2_inc_plot"
#include "x0_i0_henchman"

void main()
{
    AddHenchman(GetPCSpeaker(), OBJECT_SELF);
    SetIsFollower(OBJECT_SELF, TRUE);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_REWARD_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_REWARD_ONCE", 1);
    SetPlot("q3_deva", 97);
}
