void main()
{
    if(GetIsPC(GetEnteringObject())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2E_ALTARBEAMS")==0)
    {
        effect eVisNode1 = EffectBeam(VFX_BEAM_HOLY,GetNearestObjectByTag("M3Q2E_ALTERNEUTR"), BODY_NODE_CHEST);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisNode1, GetNearestObjectByTag("M3Q2E_ALTEREVIL"),6.0);
        effect eVisNode2 = EffectBeam(VFX_BEAM_HOLY,GetNearestObjectByTag("M3Q2E_ALTEREVIL"), BODY_NODE_CHEST);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisNode2, GetNearestObjectByTag("M3Q2E_ALTERGOOD"),6.0);
        effect eVisNode3 = EffectBeam(VFX_BEAM_HOLY,GetNearestObjectByTag("M3Q2E_ALTERGOOD"), BODY_NODE_CHEST);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVisNode3, GetNearestObjectByTag("M3Q2E_ALTERNEUTR"),6.0);
        SetLocalInt(OBJECT_SELF,"NW_G_M3Q2E_ALTARBEAMS",1);
    }
}
