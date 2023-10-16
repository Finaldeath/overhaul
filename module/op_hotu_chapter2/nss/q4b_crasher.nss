// Crasher : knockdown golems

void main()
{
    object oTarget = GetItemActivatedTarget();
    object oPC = GetItemActivator();
    effect eBeam = EffectBeam(VFX_BEAM_ODD, oPC, BODY_NODE_HAND);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.5);
    effect eDamage = EffectDamage(d10() * 3 + 30);
    if(GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
    {
        int nDur = Random(3) + 1;
        effect eKnock = EffectKnockdown();
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oTarget, RoundsToSeconds(nDur)));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
        effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
    }
}
