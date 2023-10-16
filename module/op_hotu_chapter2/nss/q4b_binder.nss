// Binder : slow golems

void main()
{
    object oTarget = GetItemActivatedTarget();
    object oPC = GetItemActivator();
    effect eBeam = EffectBeam(VFX_BEAM_ODD, oPC, BODY_NODE_HAND);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.5);
    if(GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
    {
        int nDur = Random(6) + 2;
        effect eSlow = EffectSlow();
        effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
        effect eLink = EffectLinkEffects(eSlow, eDur);
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDur)));
        effect eVis = EffectVisualEffect(VFX_IMP_SLOW);
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
    }
}
