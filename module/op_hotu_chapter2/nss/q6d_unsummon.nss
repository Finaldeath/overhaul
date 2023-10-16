// Unsummoing trigger: destroy a summoned creature

void main()
{
    object oEnter = GetEnteringObject();
    if(GetMaster(oEnter) != OBJECT_INVALID &&
        GetAssociateType(oEnter) == ASSOCIATE_TYPE_SUMMONED)
    {
        //RemoveSummonedAssociate(GetMaster(oEnter), oEnter);
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oEnter));
        DestroyObject(oEnter);
    }
}
