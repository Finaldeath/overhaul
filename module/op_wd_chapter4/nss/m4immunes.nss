// * all protectors are immune to magical damage, negative and divine
void main()
{
    effect eImmunity = EffectDamageImmunityDecrease(DAMAGE_TYPE_MAGICAL,100);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eImmunity, OBJECT_SELF);

    eImmunity = EffectDamageImmunityDecrease(DAMAGE_TYPE_NEGATIVE,100);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eImmunity, OBJECT_SELF);

    eImmunity = EffectDamageImmunityDecrease(DAMAGE_TYPE_DIVINE,100);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eImmunity, OBJECT_SELF);

}
