// Bebelith retreats into cave

void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "q5c_bebelith")
    {
        object oWP = GetNearestObjectByTag("q5c_wp_bebelith_retreat");
        AssignCommand(oEnter, ClearAllActions());
        AssignCommand(oEnter, ActionMoveToObject(oWP, TRUE));
        AssignCommand(oEnter, ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC()))));
        DelayCommand(0.5, SetCommandable(FALSE, oEnter));
        DelayCommand(3.0, SetCommandable(TRUE, oEnter));
    }
}
