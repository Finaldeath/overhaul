//act_q2aherald_10
//if the PC has enlisted  the Golems help in the battle,
//and has now placed them ready for battle 1.


void main()
{
    SetLocalInt(OBJECT_SELF, "nGolemsPlaced", 1);
    /*
    object oPC = GetPCSpeaker();
    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_rebspawn"));
    object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_fleshgol", lSpawn);
    object oGolem2 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bat_silvgol", lSpawn);
    AssignCommand(oGolem1, ActionMoveToObject(oPC));
    DelayCommand(2.5, AssignCommand(oGolem2, ActionMoveToObject(oPC)));
    */
}
