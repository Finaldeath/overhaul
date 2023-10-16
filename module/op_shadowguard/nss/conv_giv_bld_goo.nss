void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "N_ST_0_BLOOD_OFFERING", 1);

    int nDamageAmount = (GetMaxHitPoints(oPC) / 10) + 1;

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamageAmount, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_PLUS_FIVE), oPC);

    AdjustAlignment(oPC, ALIGNMENT_GOOD, 5);
}
