void main()
{
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
    string sTag = GetTag(oCreature);
    if(sTag == "Q2_KOBOLD_BLOCKER" || GetIsPC(oCreature) || !GetIsEnemy(GetFirstPC(), oCreature))
        return;

    if(GetDistanceBetween(OBJECT_SELF, oCreature) <= 5.0)
    {
        effect eDam = EffectDamage(1000);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);
    }
}
