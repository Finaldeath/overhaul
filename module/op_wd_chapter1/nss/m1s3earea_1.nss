void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1S3ESpawned") == FALSE)
    {
        location lLoc = GetLocation(GetWaypointByTag("WP_M1S3ESpawn"));
        CreateObject(OBJECT_TYPE_CREATURE,"NW_MEPAIR",lLoc);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                              EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3),
                              lLoc);
        SetLocalInt(OBJECT_SELF,"NW_L_M1S3ESpawned",TRUE);
    }
}
