// jump Kel-Garas back to middle

void main()
{
    object oExit = GetExitingObject();
    if(GetTag(oExit) == "Q2C_WP_KELGARAS")
    {
        object oWP = GetWaypointByTag("Q2C_WP_KELGARAS");
        AssignCommand(oExit, JumpToObject(oWP));
        AssignCommand(oExit, ActionRest());
    }
}
