void main()
{
    object oWP = GetNearestObjectByTag("WP_EXIT");

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oWP));

    DestroyObject(OBJECT_SELF, 5.0);
}
