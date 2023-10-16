void main()
{
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1S1GillGuards"));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
    DestroyObject(OBJECT_SELF,1.0);
}
