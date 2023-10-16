// Cordigan waits for the player after the dracolich has been killed

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetLocalInt(GetModule(), "bDracolichKilled") == 0)
        return;
    // Dracolich has been killed
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_LEADER_GREET_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_LEADER_GREET_ONCE", 1);

    object oWP = GetWaypointByTag("q3_wp_leader_sp");
    object oGnome = GetObjectByTag("q3_cordigan");
    SetLocalInt(oGnome, "STATUS", 2);
    SetCommandable(TRUE, oGnome);
    AssignCommand(oGnome, ClearAllActions());
    AssignCommand(oGnome, ActionJumpToObject(oWP));
    AssignCommand(oGnome, ActionStartConversation(oPC));

}
