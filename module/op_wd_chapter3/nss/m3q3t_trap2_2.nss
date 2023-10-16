//* Close Porticules and Spawn in Umber Hulks, then open Side Doors
void main()
{
    if(GetIsPC(GetEnteringObject()) && GetLocalInt(OBJECT_SELF,"M3Q3UndeadTrap2") == 0)
        {
            AssignCommand(GetObjectByTag("M3Q3DDPORT3"),ActionCloseDoor(OBJECT_SELF));
            AssignCommand(GetObjectByTag("M3Q3DDPORT4"),ActionCloseDoor(OBJECT_SELF));
            CreateObject(OBJECT_TYPE_CREATURE,"M3Q3CSKELWAR02",GetLocation(GetWaypointByTag("WP_M3Q3DTrap2_01")));
            CreateObject(OBJECT_TYPE_CREATURE,"M3Q3CSKELWAR02",GetLocation(GetWaypointByTag("WP_M3Q3DTrap2_02")));
            AssignCommand(GetObjectByTag("M3Q3DDOOR2A"),ActionOpenDoor(OBJECT_SELF));
            AssignCommand(GetObjectByTag("M3Q3DDOOR2B"),ActionOpenDoor(OBJECT_SELF));
            SetLocalInt(OBJECT_SELF,"M3Q3UndeadTrap2",1);
        }
}
