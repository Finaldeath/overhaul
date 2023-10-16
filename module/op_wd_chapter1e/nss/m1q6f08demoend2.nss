#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q6F08Demon_Free"))
    {
        object oSpeaker = GetPCSpeaker();
        if(GetLocalInt(OBJECT_SELF,"NW_L_Angry") && GetIsPC(oSpeaker))
        {
            ActionAttack(oSpeaker);
        }
        else if(GetLocalInt(OBJECT_SELF,"NW_L_Angry") == FALSE && GetIsPC(oSpeaker))
        {
            RewardXP("M1Q6_Demon",200,GetPCSpeaker(),ALIGNMENT_EVIL);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
            DestroyObject(OBJECT_SELF,3.0f);
        }
    }

}
