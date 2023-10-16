void main()
{
    object oPC = GetPCSpeaker();

    FadeFromBlack(oPC, FADE_SPEED_FAST);

    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM", oPC);

    effect e;

    e = EffectVisualEffect(VFX_FNF_SUMMON_GATE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, e, oCP);

    e = EffectDisappear();

    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, e, oCP));

    DestroyObject(oCP, 6.0);
}
