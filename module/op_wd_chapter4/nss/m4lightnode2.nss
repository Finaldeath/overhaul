//* lightning between objects
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M4LIGHT2")==0)
    {
        effect eVis = EffectVisualEffect(VFX_BEAM_LIGHTNING);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, GetNearestObjectByTag("M4LightNode3"));
        SetLocalInt(OBJECT_SELF,"NW_G_M4LIGHT2",1);
    }
}
