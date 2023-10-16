void main()
{
    object oWP = GetNearestObjectByTag("MP_VOYAGER");

    location lWP = GetLocation(oWP);

    AssignCommand(OBJECT_SELF, DelayCommand(5.0, ActionMoveToLocation(lWP, TRUE)));
}
