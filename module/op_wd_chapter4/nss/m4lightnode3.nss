//* lightning between objects
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M4LIGHT3")==0)
    {
        effect eVis = EffectVisualEffect(VFX_BEAM_LIGHTNING);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, GetNearestObjectByTag("M4LightNode1"));
        SetLocalInt(OBJECT_SELF,"NW_G_M4LIGHT3",1);
    }
}
