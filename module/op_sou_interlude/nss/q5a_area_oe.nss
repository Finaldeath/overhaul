// flag player as entered the camp: needed to determine starting location

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC)) // good for DMs also
        return;
    SetLocalInt(oPC, "X1_ENTRED_AO_CAMP", 1);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_HENCHMEM_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_HENCHMEM_ONCE", 1);

    object oDeekin = GetObjectByTag("x0_hen_dee");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oXanos = GetObjectByTag("x0_hen_xan");

    object oDeekinWP = GetWaypointByTag("Q5A_WP_DEEKIN");
    object oDornaWP = GetWaypointByTag("Q5A_WP_DORNA");
    object oXanosWP = GetWaypointByTag("Q5A_WP_XANOS");

    AssignCommand(oDeekin, JumpToObject(oDeekinWP));
    AssignCommand(oDorna, JumpToObject(oDornaWP));
    AssignCommand(oXanos, JumpToObject(oXanosWP));

}
