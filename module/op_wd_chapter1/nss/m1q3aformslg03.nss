void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q3AFormosaLeave"))
    {
        ClearAllActions();
        ActionForceMoveToObject(GetNearestObjectByTag("WP_Form_01"),FALSE,1.0,6.0);
        ActionForceMoveToObject(GetNearestObjectByTag("M1Q3A_M1Q3G"),FALSE,1.0,6.0);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
}
