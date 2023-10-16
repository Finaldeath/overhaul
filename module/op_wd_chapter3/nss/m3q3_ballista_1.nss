void main()
{
    int nLocal = GetLocalInt(OBJECT_SELF, "M3Q3_BALLISTA_SET");

    if(nLocal = TRUE)
    {
        object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_LRG_RED), oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(10, DAMAGE_TYPE_PIERCING),oTarget);
    }
    else
    {
        vector vPosition = GetPosition(GetWaypointByTag("M3Q3_BALLISTA"));
        SetFacingPoint(vPosition);
        SetLocalInt(OBJECT_SELF, "M3Q3_BALLISTA_SET", TRUE);
    }

}
