#include "help_general"

void main()
{
    object oKara = GetNearestObjectByTag("CS_OP_HENCH_KARA");

    object oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1");

    AssignCommand(oKara, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 6.0));

    SetLocalInt(oGuard, "N_DONT_DESTROY_ON_DEATH", 0);

    DelayCommand(2.0, MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oGuard));

    MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), oGuard);
}
