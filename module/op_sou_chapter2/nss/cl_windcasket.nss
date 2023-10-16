void main()
{
    object oDarkWind = GetItemPossessedBy(OBJECT_SELF, "ITEM_DarkWind");
    object oDeadWind = GetItemPossessedBy(OBJECT_SELF, "ITEM_DeadWind");
    object oWiseWind = GetItemPossessedBy(OBJECT_SELF, "ITEM_WiseWind");

    if (oDarkWind == OBJECT_INVALID &&
        oDeadWind == OBJECT_INVALID &&
        oWiseWind == OBJECT_INVALID)
    {
        effect eVFX = EffectVisualEffect(VFX_IMP_ELEMENTAL_PROTECTION);
        location lLoc = GetLocation(OBJECT_SELF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lLoc);
        DestroyObject(OBJECT_SELF);
    }
}
