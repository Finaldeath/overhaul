void main()
{
    if (GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") == 20 &&
        GetLocalInt(OBJECT_SELF,"NW_A_KarathisSpawn") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_A_KarathisSpawn",10);
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q01CKARATHIS",GetLocation(GetWaypointByTag("WP_M2Q1KARATHIS")));
    }
}
