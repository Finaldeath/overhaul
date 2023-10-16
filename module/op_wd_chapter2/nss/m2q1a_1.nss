void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_NightSailor") == 0 &&
        GetIsNight())
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_NightSailor",10);
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q01CNIGHTSAIL",GetLocation(GetWaypointByTag("WP_M2Q1SAILNIGHT")));
    }
}
