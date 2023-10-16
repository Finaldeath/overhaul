// * custom blade barrier for wall of blades around Morag

void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_COM_BLOOD_LRG_RED);

if(!GetIsReactionTypeFriendly(oTarget, GetObjectByTag("M4Q01D08MORA")))
{
    //Roll Damage
    int nDamage = 150 + d100(1);
    eDam = EffectDamage(nDamage, DAMAGE_TYPE_SLASHING);
    //Apply damage and VFX
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}
}
