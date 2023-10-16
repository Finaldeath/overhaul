void main()
{
    object oItem = GetInventoryDisturbItem();
    string sTag = GetTag(oItem);

    if(sTag == "M3Q3B_REAGENT_01")
    {
        object oTwin = GetItemPossessedBy(GetObjectByTag("M3Q3B_SUMMONING_POOL_01A"), "M3Q3B_REAGENT_02");
        if(GetIsObjectValid(oTwin))
        {
            CreateObject(OBJECT_TYPE_CREATURE, "M3Q3B_SUMM_WATER", GetLocation(GetWaypointByTag("M3Q3B_WATER_SPAWN_01")));
            DestroyObject(oItem, 1.0);
            DestroyObject(oTwin, 1.0);
        }
    }
    else if(sTag == "M3Q3B_REAGENT_02")
    {
        object oTwin = GetItemPossessedBy(GetObjectByTag("M3Q3B_SUMMONING_POOL_01A"), "M3Q3B_REAGENT_01");
        if(GetIsObjectValid(oTwin))
        {
            CreateObject(OBJECT_TYPE_CREATURE, "M3Q3B_SUMM_WATER", GetLocation(GetWaypointByTag("M3Q3B_WATER_SPAWN_01")));
            DestroyObject(oItem, 1.0);
            DestroyObject(oTwin, 1.0);
        }
    }
}
