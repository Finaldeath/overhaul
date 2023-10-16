void main()
{
    string sTag = "M1Q6F03Fenthick";
    object oExit = GetExitingObject();
    if(GetTag(oExit) == sTag)
    {
        AssignCommand(oExit,ClearAllActions());
        AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + sTag)));
    }
}
