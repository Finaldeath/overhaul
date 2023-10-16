void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_ImpSpawned") == FALSE)
    {
        location lImp = GetLocation(GetWaypointByTag("SP_M1Q5D02Imp"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),lImp);
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q5D02Imp",lImp);
        SetLocalInt(OBJECT_SELF,"NW_L_ImpSpawned",TRUE);
    }
}
