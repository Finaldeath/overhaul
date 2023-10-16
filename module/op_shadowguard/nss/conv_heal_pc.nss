void main()
{
    object oPC = GetPCSpeaker();

    int nHP = GetMaxHitPoints(oPC);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHP), oPC);
}
