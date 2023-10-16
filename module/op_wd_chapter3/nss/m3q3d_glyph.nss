// * Golem gets Activated
void main()
{
    object o1 = GetNearestObjectByTag("M3Q3Generator1");
    object o2 = GetNearestObjectByTag("M3Q3Generator2");
    object o3 = GetNearestObjectByTag("M3Q3Generator3");
    object o4 = GetNearestObjectByTag("M3Q3D17Blunt");
    effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING, o1, BODY_NODE_CHEST, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam, OBJECT_SELF,1.0);
    eBeam = EffectBeam(VFX_BEAM_LIGHTNING, o2, BODY_NODE_CHEST, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam, OBJECT_SELF,1.0);
    eBeam = EffectBeam(VFX_BEAM_LIGHTNING, o3, BODY_NODE_CHEST, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam, OBJECT_SELF,1.0);
    eBeam = EffectBeam(VFX_BEAM_LIGHTNING, o4, BODY_NODE_CHEST, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam, OBJECT_SELF,1.0);

}
