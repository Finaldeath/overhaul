void main()
{
    if (GetIsPC(GetEnteringObject()) && GetLocalInt(OBJECT_SELF,"NW_L_Spawn") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Spawn",10);
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q05CTOMBMUMMY2",GetLocation(GetWaypointByTag("WP_M2Q5MummySpawn")));
    }
}
