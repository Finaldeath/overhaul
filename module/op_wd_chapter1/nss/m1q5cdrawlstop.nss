void main()
{
    object oExit = GetExitingObject();
    object oDrawl = GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl");
    if(GetIsObjectValid(oDrawl) &&
       oDrawl == oExit)
    {
        AssignCommand(oDrawl,ClearAllActions());
        AssignCommand(oDrawl,ActionMoveToObject(GetObjectByTag("WP_M1Q5C_DrawlReturn")));
    }
}
