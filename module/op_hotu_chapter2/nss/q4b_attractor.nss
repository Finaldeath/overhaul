// Attracts any nearby golems

void main()
{
    effect eVis = EffectVisualEffect(VFX_IMP_PULSE_FIRE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF);
    int i = 1;
    object oGolem = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_CONSTRUCT, OBJECT_SELF, i);
    float fDistance;
    object oTarget = OBJECT_SELF;
    while(oGolem != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oGolem);
        if(fDistance > 30.0)
            return;
        AssignCommand(oGolem, ClearAllActions());
        AssignCommand(oGolem, ActionMoveToObject(oTarget, TRUE));
        oGolem = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_CONSTRUCT, OBJECT_SELF, i);
        i++;
    }
}
