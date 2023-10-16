void main()
{
    ClearAllActions();
    ActionForceMoveToObject(GetNearestObjectByTag("M1Q3B_M1Q3A"));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
