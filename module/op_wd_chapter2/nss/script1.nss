void main()
{
    if (GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") == 20)
    {
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q01CALHELOR",GetLocation(GetWaypointByTag("")));
    }
}
