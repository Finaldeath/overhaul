// give player fire immunity

void main()
{
    object oEnter = GetEnteringObject();
    int nInside = GetLocalInt(oEnter, "Q2D_INSIDE");
    if(nInside == 0)
    {
        SetLocalInt(oEnter, "Q2D_INSIDE", 1);
        effect eFire = EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 100);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFire, GetEnteringObject());
    }
}
