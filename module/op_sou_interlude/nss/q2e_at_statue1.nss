// climb and grub a rubby -> a failed dex check means falling to the ground.
// A success means getting one ruby and the statue animates.

void main()
{
    //object oStatue = GetNearestObjectByTag("Q2E_STATUE_BANE");
    int nRand = Random(6) + 1;
    DelayCommand(0.3, SignalEvent(OBJECT_SELF, EventUserDefined(101)));
    effect eDam = EffectDamage(nRand, DAMAGE_TYPE_BLUDGEONING);
    effect eKnock = EffectKnockdown();
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, GetPCSpeaker(), 3.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, GetPCSpeaker());
}
