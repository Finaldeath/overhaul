void main()
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), GetPCSpeaker(), 3.0);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(10, DAMAGE_TYPE_ELECTRICAL), GetPCSpeaker());

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), GetPCSpeaker(), 3.0);
}
