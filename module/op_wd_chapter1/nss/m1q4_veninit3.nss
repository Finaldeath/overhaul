void main()
{
    string sTag = "m1Q04CVengaul";
    object oExit = GetExitingObject();
    if(GetTag(oExit) == sTag)
    {
        AssignCommand(oExit,ClearAllActions());
        AssignCommand(oExit,ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + sTag)));
    }
}
