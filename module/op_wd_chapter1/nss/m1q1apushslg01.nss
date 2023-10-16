void main()
{
    object oSelf = OBJECT_SELF;
    ClearAllActions();
    object oDoor = GetNearestObjectByTag("M1Q1A_M1Q1F");
    ActionForceMoveToObject(oDoor,FALSE,2.0f,5.0f);
    ActionDoCommand(DestroyObject(oSelf));
    SetCommandable(FALSE);

}
