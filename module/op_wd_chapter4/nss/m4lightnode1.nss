//* lightning between objects
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M4LIGHT1")==0)
    {
        effect eVis = EffectBeam(VFX_BEAM_LIGHTNING,OBJECT_SELF, BODY_NODE_HAND);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, GetNearestObjectByTag("M4LightNode2"));
        SetLocalInt(OBJECT_SELF,"NW_G_M4LIGHT1",1);
    }
}
