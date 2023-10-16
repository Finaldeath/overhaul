// the bear dies

void main()
{
    int nBear = GetCurrentHitPoints();
    effect eKill = EffectDamage(nBear);
    effect eDeath = EffectDeath();

    ClearAllActions();
    ActionWait(1.0);
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, eKill, OBJECT_SELF));

    if (GetCurrentHitPoints() > 0)
    {
        ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF));
    }
}
