#include "nw_i0_plot"

void main()
{
    object oArtifact = GetObjectByTag("ARTI_ITEM01");
    ActionTakeItem(oArtifact,GetPCSpeaker());
    RewardGP(500,GetPCSpeaker(),FALSE);
    RewardXP("NW_ARTI_PLOT",100,GetPCSpeaker());
}
