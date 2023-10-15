void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 40:
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q0CutScene",40);
            SpeakOneLinerConversation("M1Q0EFinal");
            DelayCommand(0.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,
                                EffectVisualEffect(VFX_IMP_UNSUMMON),
                                OBJECT_SELF));
            DestroyObject(OBJECT_SELF,1.0);
        }
    }
}
