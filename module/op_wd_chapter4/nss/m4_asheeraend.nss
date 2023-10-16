// * This script makes Asheera leave
void main()
{
    effect eVisualEffect = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisualEffect, OBJECT_SELF);
    // * give her enough time to say parting line
    DestroyObject(OBJECT_SELF, 2.3);
    SpeakOneLinerConversation();
    // * make it so her leaving can't be interrupted
    SetCommandable(FALSE);
}
