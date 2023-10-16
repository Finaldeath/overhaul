//act_q2aherald_9
//if the PC has enlisted  the Deva's help in the battle,
//and has now placed her for battle 1.


void main()
{
    SetLocalInt(OBJECT_SELF, "nDevaPlaced", 1);
    /*
    object oPC = GetPCSpeaker();
    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));
    object oDeva = CreateObject(OBJECT_TYPE_CREATURE, "lavoera", lSpawn);
    AssignCommand(oDeva, ActionMoveToObject(oPC));
    */
}
