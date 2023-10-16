void main()
{
    object oPC = GetPCSpeaker();

    object oHench = GetHenchman(oPC);

    if (oHench != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oHench);
    }
}
