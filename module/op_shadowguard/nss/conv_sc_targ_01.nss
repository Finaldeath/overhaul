void main()
{
    object oWP = GetNearestObjectByTag("WP_ADANS_GRAVE_STAND");
    location lWP = GetLocation(oWP);

    AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP));
}
