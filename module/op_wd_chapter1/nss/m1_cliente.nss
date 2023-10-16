void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

    effect eBad = GetFirstEffect(oTarget);
    //Search for negative effects
    while(GetIsEffectValid(eBad))
    {
        if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
            GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
            GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
            GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
            GetEffectType(eBad) == EFFECT_TYPE_POISON ||
            GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
        {
            //Remove effect if it is negative.
            RemoveEffect(oTarget, eBad);
        }
        eBad = GetNextEffect(oTarget);
    }
    if(GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
    {
        //Apply the VFX impact and effects
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        if(nHeal > 0)
        {
            effect eHeal = EffectHeal(nHeal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        }
    }
    //Fire cast spell at event for the specified target
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
}
