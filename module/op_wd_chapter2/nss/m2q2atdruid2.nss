void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(GetModule(),"M2Q2_DRUIDARENA1",10);
    AssignCommand(oPC,ActionJumpToObject(GetWaypointByTag("WP_DruidArenaPlayer")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2CD1JAER",GetLocation(GetWaypointByTag("WP_DruidArenaSpawn")));
}


