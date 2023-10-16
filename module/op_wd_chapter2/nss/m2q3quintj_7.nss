void main()
{
    if (GetLocalInt(GetModule(),"NW_G_JharegSummons") == 0)
    {
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q3J_QUINT",GetLocation(GetWaypointByTag("WP_QUINTJSPAWN")));
    }
}
