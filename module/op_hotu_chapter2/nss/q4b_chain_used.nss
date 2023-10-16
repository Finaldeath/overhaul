// Chain used: destroy weapon spirit

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    effect eDeath = EffectDeath();
    object oSpirit = GetObjectByTag("q4b_WeaponSpirit");
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oSpirit);
}
