
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

    object oWP = GetNearestObjectByTag("q4c_wp_aghaaz_walk", oPC);
    object oAghaaz = GetNearestObjectByTag("q4c_aghaaz");

    if(oAghaaz == OBJECT_INVALID || GetIsDead(oAghaaz))
        return;
    DelayCommand(2.0, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(3.2, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(3.5, AssignCommand(oAghaaz, Talk(oPC)));
    AssignCommand(oAghaaz, ActionMoveToLocation(GetLocation(oWP), FALSE));

}
