//act_q2d6golem_2
//PC has a drink from the golems mug - apply some bad effects.
void main()
{
    object oPC = GetPCSpeaker();

    effect eKnock = EffectKnockdown();
    effect eCon = EffectAbilityDecrease(ABILITY_CONSTITUTION, 4);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oPC, 5.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCon, oPC, 120.0);

    FadeToBlack(oPC);
    DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
}
