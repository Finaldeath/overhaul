void main()
{
    object oDesther = GetNearestObjectByTag("M1Q0EDesther");
    switch(GetUserDefinedEventNumber())
    {
        case 20:
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q0CutScene",20);
            SpeakOneLinerConversation("M1Q0EFinal");
            DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,
                                                 EffectVisualEffect(VFX_IMP_UNSUMMON),
                                                 OBJECT_SELF));
            DestroyObject(OBJECT_SELF,1.5);
            SignalEvent(oDesther,EventUserDefined(30));
        }
    }
}
