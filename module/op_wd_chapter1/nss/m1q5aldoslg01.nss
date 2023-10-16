void main()
{
    object oWP = GetObjectByTag("WP_M1Q5AldoEscape");
    object oMattily = GetLocalObject(GetModule(),"NW_G_oMattily");
    ClearAllActions();
    ActionForceMoveToObject(oWP);
    ActionDoCommand(DestroyObject(OBJECT_SELF));

    AssignCommand(oMattily,ClearAllActions());
    AssignCommand(oMattily,ActionForceMoveToObject(oWP));
    AssignCommand(oMattily,ActionDoCommand(DestroyObject(oMattily)));
}
