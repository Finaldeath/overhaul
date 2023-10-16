#include "help_general"

void main()
{
    object oKing = GetNearestObjectByTag("CT_UNIQ_NT_DL_0_2");

    object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH_2");

    object oGuard;

    AssignCommand(oRakha, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 4.0));

    SetPlotFlag(oKing, FALSE);

    MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oKing);

    MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oKing);

    int i = 1;

    int NUMB_OF_GUARDS = 3;

    while (i <= NUMB_OF_GUARDS)
    {
        oGuard = GetNearestObjectByTag("CT_COMM_EVIL_SOLD_1", OBJECT_SELF, i);

        SetPlotFlag(oGuard, FALSE);

        MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oGuard);

        MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oGuard);

        i++;
    }
}
