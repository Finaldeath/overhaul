// Scout trigger 1 - drow scout runs away to the holes area.

void Run()
{
    object oScout = GetNearestObjectByTag("bk_DrowScout");
    object oWP = GetWaypointByTag("bk_wp_scout1");
    object oFocus = GetWaypointByTag("bk_wp_scout0");

    AssignCommand(oScout, ActionMoveToObject(oWP, TRUE, 0.0));
    AssignCommand(oScout, ActionDoCommand(SetFacingPoint(GetPosition(oFocus))));
    AssignCommand(oScout, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 0.0, 99999.9));
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

    Run();

}
