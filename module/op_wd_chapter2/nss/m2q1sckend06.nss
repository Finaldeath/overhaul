// sets the bounty plot as having been accepted
// keeps track of which PC accepted the plot

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT",1);
        SetLocalObject(OBJECT_SELF,"PC_KENDRACK_PLOT",GetPCSpeaker());
        SetCustomToken(1007,GetName(GetPCSpeaker()));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CZOR",GetLocation(GetWaypointByTag("WP_ZOR")));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CSTIRGE",GetLocation(GetWaypointByTag("WP_STIRGE")));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CWYVERN",GetLocation(GetWaypointByTag("WP_WYVERN")));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q04CDELILAH",GetLocation(GetWaypointByTag("WP_DELILAH")));
    }
}
