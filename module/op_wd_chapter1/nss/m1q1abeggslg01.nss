void main()
{
    ClearAllActions();
    ActionForceMoveToObject(GetNearestObjectByTag("M1Q1_M1Q5A3"),FALSE,4.0);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}

