void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    int nAC = GetAC(oTarget);
    //Make attack roll
    int nRoll = d20() + 10 + 2;
    effect eDam = EffectDamage(d6(2), DAMAGE_TYPE_PIERCING);

    if (nRoll > nAC && GetLocalInt(GetModule(),"NW_G_GorkanHostile") > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    }
}
