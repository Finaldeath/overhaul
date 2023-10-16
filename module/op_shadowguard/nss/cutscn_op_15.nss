#include "help_general"

void main()
{
    object oKara = GetNearestObjectByTag("CS_OP_HENCH_KARA");

    object oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1");

    AssignCommand(oKara, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 6.0));

    ChangeToStandardFaction(oGuard, STANDARD_FACTION_MERCHANT);

    SetPlotFlag(oGuard, FALSE);

    MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oGuard);

    MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(1), oGuard);

    AssignCommand(oGuard, ClearAllActions());

    AssignCommand(oGuard, DelayCommand(3.0, MyApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oGuard)));

    SetLocalInt(oGuard, "N_STOP_PLAYING_DEAD", 1);
}
