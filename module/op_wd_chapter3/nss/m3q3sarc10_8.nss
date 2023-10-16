// * Summon in UNdead when chest is opened

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    {
        SetLocked(GetObjectByTag("M3Q3DOOR10A"),FALSE);
        SetLocked(GetObjectByTag("M3Q3DOOR10B"),FALSE);
        SetLocked(GetObjectByTag("M3Q3DOOR10C"),FALSE);
        SetLocked(GetObjectByTag("M3Q3DOOR10D"),FALSE);
        CreateObject(OBJECT_TYPE_CREATURE,"M3Q3C_MUMMY10",GetLocation(GetWaypointByTag("WP_M3Q3SPAWN_10A")));
        CreateObject(OBJECT_TYPE_CREATURE,"M3Q3C_WIGHT10",GetLocation(GetWaypointByTag("WP_M3Q3SPAWN_10B")));
        CreateObject(OBJECT_TYPE_CREATURE,"M3Q3C_SKELETON10",GetLocation(GetWaypointByTag("WP_M3Q3SPAWN_10C")));
        CreateObject(OBJECT_TYPE_CREATURE,"M3Q3C_MUMMY10",GetLocation(GetWaypointByTag("WP_M3Q3SPAWN_10D")));
        ActionOpenDoor(GetObjectByTag("M3Q3DOOR10A"));
        ActionOpenDoor(GetObjectByTag("M3Q3DOOR10B"));
        ActionOpenDoor(GetObjectByTag("M3Q3DOOR10C"));
        ActionOpenDoor(GetObjectByTag("M3Q3DOOR10D"));
        SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        // * Spawn in Random Treasure
        ExecuteScript("NW_O2_GENERALMED", OBJECT_SELF);
    }

}
