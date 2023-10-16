#include "nw_i0_plot"

void main()
{
    RewardGP(300,GetPCSpeaker(),FALSE);
    RewardXP("NW_ASSA_PLOT",100,GetPCSpeaker(),ALIGNMENT_EVIL);
    SetLocalInt(OBJECT_SELF,"NW_ASSA_PLOT",2);
}
