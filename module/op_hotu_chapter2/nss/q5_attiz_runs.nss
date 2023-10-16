// Attiz runs away and disappears permanently

void main()
{
    object oWP = GetNearestObjectByTag("q5b_wp_attiz_run");
    ActionForceMoveToObject(oWP, TRUE, 0.0, 6.0);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    DelayCommand(0.5, SetCommandable(FALSE, OBJECT_SELF));
}
