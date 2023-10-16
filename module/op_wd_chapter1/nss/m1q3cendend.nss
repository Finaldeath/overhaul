void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_HeadReturned"))
    {
        ClearAllActions();
        ActionForceMoveToObject(GetNearestObjectByTag("M1Q3I_M1Q1A"));
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
}
