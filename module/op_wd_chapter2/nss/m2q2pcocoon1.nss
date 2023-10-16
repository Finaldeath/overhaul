void main()
{
    if (GetLastUsedBy() == GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC))
    {
        location lSpawn = GetLocation(OBJECT_SELF);
        effect eWeb = EffectVisualEffect(VFX_DUR_WEB);

        SetPlotFlag(OBJECT_SELF,FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWeb, OBJECT_SELF, RoundsToSeconds(1));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q2IOrlane",lSpawn);
        DestroyObject(OBJECT_SELF);
    }
}
