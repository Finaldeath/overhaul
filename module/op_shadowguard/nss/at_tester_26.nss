void main()
{
    int nInt = GetLocalInt(OBJECT_SELF, "N_COMBINATION");

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectStunned(), GetPCSpeaker(), 20.0);
}
