void main()
{
    object oBruk = GetHenchman(GetPCSpeaker());

    RemoveHenchman(GetPCSpeaker(), oBruk);

    DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), oBruk));
    DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_SLEEP), oBruk));
}
