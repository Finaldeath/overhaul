#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q6F08GuardGiftGiven") == TRUE)
    {
        RewardXP("M1Q6_Demon",100,GetPCSpeaker(),ALIGNMENT_GOOD);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
        DestroyObject(OBJECT_SELF,1.0f);
    }
}
