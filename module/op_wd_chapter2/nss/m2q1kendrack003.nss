void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M2BanditPlot") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_M2BanditPlot",10);
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CZOR",GetLocation(GetWaypointByTag("WP_ZOR")));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CSTIRGE",GetLocation(GetWaypointByTag("WP_STIRGE")));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CWYVERN",GetLocation(GetWaypointByTag("WP_WYVERN")));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q04CDELILAH",GetLocation(GetWaypointByTag("WP_DELILAH")));
    }
}
