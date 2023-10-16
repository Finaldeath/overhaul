void main()
{
    int nInt = GetLocalInt(OBJECT_SELF, "N_COMBINATION");

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedDecrease(nInt), GetPCSpeaker());
}
