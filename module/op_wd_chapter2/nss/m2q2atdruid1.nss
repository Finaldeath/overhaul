void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(GetModule(),"M2Q2_DRUIDARENA",10);
    AssignCommand(oPC,ActionJumpToObject(GetWaypointByTag("WP_DruidArenaPlayer")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2CDAAWILL",GetLocation(GetWaypointByTag("WP_DruidArenaSpawn")));
}

