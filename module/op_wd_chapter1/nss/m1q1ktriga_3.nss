void main()
{
    object oExit = GetExitingObject();
    if(GetTag(oExit) == "M1Q1KFenthick")
    {
        AssignCommand(oExit,ClearAllActions());
        AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("WP_M1Q1KFenthick")));
    }
}
