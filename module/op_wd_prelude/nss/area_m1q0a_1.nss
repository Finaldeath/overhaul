void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) &&
       GetMaxHitPoints(oPC) == GetCurrentHitPoints(oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(1),oPC);
    }
}
