void main()
{
    object oPC = GetPCSpeaker();

    effect eBeam = EffectBeam(VFX_BEAM_FIRE_LASH, OBJECT_SELF, BODY_NODE_CHEST);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oPC, 4.0);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(10, DAMAGE_TYPE_FIRE), oPC);
}
