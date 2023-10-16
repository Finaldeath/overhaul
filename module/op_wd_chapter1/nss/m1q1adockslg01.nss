void main()
{
    ClearAllActions();
    ActionForceMoveToObject(GetNearestObjectByTag("M1Q1A_M1Q4A"),FALSE,4.0);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}


