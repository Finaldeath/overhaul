// * This script makes Asheera leave
void main()
{
    object oAsh = GetObjectByTag("M4Q1D02PALA");
    if (GetIsObjectValid(oAsh) == TRUE && GetIsPC(GetEnteringObject()))
    {
        effect eVisualEffect = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisualEffect, oAsh);
        DestroyObject(oAsh, 0.1);
        SpeakOneLinerConversation();
    }
}
