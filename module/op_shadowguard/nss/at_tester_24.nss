void main()
{
    int nInt = GetLocalInt(OBJECT_SELF, "N_COMBINATION");

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), GetPCSpeaker(), 20.0);
}
