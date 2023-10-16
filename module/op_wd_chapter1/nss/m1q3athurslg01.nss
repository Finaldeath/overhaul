void main()
{
    ClearAllActions();
    ActionMoveToObject(GetNearestObjectByTag("WP_M1S4AThurinLeave"));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);

}
