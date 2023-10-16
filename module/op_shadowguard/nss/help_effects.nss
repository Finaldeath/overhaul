void SpecialFireballAttack(location l, float fDelay)
{
    object oFE = CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_EFFECT_FRBL", l);

    DelayCommand(fDelay, AssignCommand(oFE, ActionCastSpellAtLocation(SPELL_FIREBALL, l, METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));

    DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE), l));

    DestroyObject(oFE, fDelay + 3.1);
}
