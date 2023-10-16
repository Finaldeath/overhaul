void main()
{
    if (GetLocalInt(GetModule(),"NW_G_JharegSummons") == 0)
    {
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q3I_KARLAT",GetLocation(GetWaypointByTag("WP_KARLATISPAWN")));
    }
}
