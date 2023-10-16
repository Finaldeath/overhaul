// jump gargoyles away so they won't leave area

void main()
{
    object oGarg = GetEnteringObject();
    if(GetTag(oGarg) != "NW_GARGOYLE")
        return;
    object oWP1 = GetWaypointByTag("Q2B_WP_GARG_JUMP");
    object oWP2 = GetWaypointByTag("Q2B_WP_GARG_RUN");
    AssignCommand(oGarg, ClearAllActions());
    AssignCommand(oGarg, JumpToObject(oWP1));
    AssignCommand(oGarg, ActionMoveToObject(oWP2, TRUE));
}
