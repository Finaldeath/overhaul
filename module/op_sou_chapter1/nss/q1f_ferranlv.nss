// Ferran leaves the area permanently

void main()
{
    object oLeave = GetObjectByTag("x0_RuneStone1");
    ClearAllActions();
    ActionMoveToObject(oLeave, TRUE);
    DestroyObject(OBJECT_SELF, 5.0);
    SetCommandable(FALSE);
}
