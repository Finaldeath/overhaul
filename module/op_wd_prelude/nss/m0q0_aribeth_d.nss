void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
        case 10:
            {
            CreateObject(OBJECT_TYPE_CREATURE,"M0Q0_EVILMAGE_01",GetLocation(GetWaypointByTag("WP_M0Q0_EVILMAGE_01")));
            CreateObject(OBJECT_TYPE_CREATURE,"M0Q0_EVILMAGE_02",GetLocation(GetWaypointByTag("WP_M0Q0_EVILMAGE_02")));
            CreateObject(OBJECT_TYPE_CREATURE,"M0Q0_EVILROG_01",GetLocation(GetWaypointByTag("WP_M0Q0_EVILROG_01")));
            }
        break;
    }
}
