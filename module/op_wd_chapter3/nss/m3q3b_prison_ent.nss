void main()
{
if(GetIsObjectValid(GetObjectByTag("M3Q3B_PRISON_BEAM_01")) && GetIsObjectValid(GetObjectByTag("M3Q3B_PRISON_BEAM_02")))
    {
    object oTarget = GetEnteringObject();
    effect eDam = EffectDamage(1000);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    }
}
