void main()
{
    if (GetIsPC(GetEnteringObject()))
    {
        effect eVis = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
        location lLoc = GetLocation(GetNearestObjectByTag("WP_Morag"));
        object oMorag = CreateObject(OBJECT_TYPE_CREATURE,"moragm1q007",lLoc,TRUE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),lLoc);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oMorag);
        DestroyObject(OBJECT_SELF);
    }
}
