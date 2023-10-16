#include "nw_i0_plot"

void main()
{
    RewardGP(500,GetPCSpeaker(),FALSE);
    SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
    RewardXP("m1q3_KillFormosa",100,GetPCSpeaker(),ALIGNMENT_EVIL);
    SetLocalInt(OBJECT_SELF,"NW_FORMOSA_JOB",2);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
    DestroyObject(OBJECT_SELF,1.0);
}
