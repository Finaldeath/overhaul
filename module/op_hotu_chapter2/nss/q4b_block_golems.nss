// Prevent golems from passing this point

void main()
{
    object oWP = GetWaypointByTag("q4b_wp_blocker");
    object oEnter = GetEnteringObject();
    if(GetStringLeft(GetTag(oEnter), 2) == "q4")
    {
        AssignCommand(oEnter, ClearAllActions());
        AssignCommand(oEnter, JumpToObject(oWP));
    }
}
