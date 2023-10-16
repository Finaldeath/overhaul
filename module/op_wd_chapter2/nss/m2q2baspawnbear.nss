void main()
{
    if (GetIsPC(GetEnteringObject()))
    {
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q2CBEARTROLL",GetLocation(GetWaypointByTag("WP_M2Q2DIREBEAR")));
        DestroyObject(OBJECT_SELF);
    }
}
