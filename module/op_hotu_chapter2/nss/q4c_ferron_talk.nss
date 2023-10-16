
void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oWP = GetWaypointByTag("q4c_wp_ferron_walk");
    object oFerron = GetNearestObjectByTag("q4c_ferron");
    if(oFerron == OBJECT_INVALID || GetIsDead(oFerron))
        return;
    DelayCommand(2.0, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(3.2, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(3.5, AssignCommand(oFerron, Talk(oPC)));
    DelayCommand(2.0, AssignCommand(oFerron, ActionMoveToLocation(GetLocation(oWP), FALSE)));

}
