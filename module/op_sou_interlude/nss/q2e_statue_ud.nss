// statue archer ud event - fire an arrow

#include "NW_I0_SPELLS"

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "TARGET");
    int nDamageArrow;
    int nDamageFire;
    effect eDamArrow;
    effect eDamFire;
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_S);
    effect eArrow = EffectVisualEffect(VFX_IMP_MIRV_FLAME);
    float fDelay = GetDistanceBetween(OBJECT_SELF, oTarget) / 10.0;
    if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, 22, SAVING_THROW_TYPE_TRAP))
    {
        nDamageArrow = d8(1);
        nDamageFire = d6(2);
        eDamArrow = EffectDamage(nDamageArrow, DAMAGE_TYPE_PIERCING);
        eDamFire = EffectDamage(nDamageFire, DAMAGE_TYPE_FIRE);
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis,oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamArrow,oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamFire,oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eArrow, oTarget);
    }
    else
    {
        object oInv = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eArrow, oInv);
        //DestroyObject(oInv);
    }
}

