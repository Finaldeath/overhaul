//* Close Porticules and Spawn in Umber Hulks, then open Side Doors
void main()
{
    if(GetIsPC(GetEnteringObject()) && GetLocalInt(OBJECT_SELF,"M3Q3UndeadTrap1") == 0)
        {
            AssignCommand(GetObjectByTag("M3Q3DDPORT1"),ActionCloseDoor(OBJECT_SELF));
            AssignCommand(GetObjectByTag("M3Q3DDPORT2"),ActionCloseDoor(OBJECT_SELF));
            SetLocked(GetObjectByTag("M3Q3DDPORT1"),TRUE);
            SetLocked(GetObjectByTag("M3Q3DDPORT2"),TRUE);
            CreateObject(OBJECT_TYPE_CREATURE,"M3Q3CSKELWAR01",GetLocation(GetWaypointByTag("WP_M3Q3DTrap1_01")));
            CreateObject(OBJECT_TYPE_CREATURE,"M3Q3CSKELWAR01",GetLocation(GetWaypointByTag("WP_M3Q3DTrap1_02")));
            AssignCommand(GetObjectByTag("M3Q3DDOOR1A"),ActionOpenDoor(OBJECT_SELF));
            AssignCommand(GetObjectByTag("M3Q3DDOOR1B"),ActionOpenDoor(OBJECT_SELF));
            SetLocalInt(OBJECT_SELF,"M3Q3UndeadTrap1",1);
        }
}
