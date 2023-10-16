// Allow a cleric or druid to cast a single spell in the dead-magic zone


#include "nw_i0_spells"

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(OBJECT_SELF, "Q5C_SPELLS_LEFT", 1);
    effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    effect eStrength = EffectAbilityIncrease(ABILITY_STRENGTH, 6);
    effect eHP = EffectTemporaryHitpoints(20);
    effect eAttack = EffectAttackIncrease(2);
    effect eAC = EffectACIncrease(6, AC_DEFLECTION_BONUS);
    effect eAttackMod = EffectModifyAttacks(CalcNumberOfAttacks());
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    effect eLink = EffectLinkEffects(eAttack, eAttackMod);
    eLink = EffectLinkEffects(eLink, eDur);
    eLink = EffectLinkEffects(eLink, eStrength);
    eLink = EffectLinkEffects(eLink, eAC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, RoundsToSeconds(20));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oPC, RoundsToSeconds(20));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
}
