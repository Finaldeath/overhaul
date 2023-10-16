//Farm hand goes 'outside' to do chores..
void main()
{
    object oTarget = GetWaypointByTag("wp_q1ff_farmexit");
    ActionMoveToObject(oTarget);
    SetCommandable(FALSE);
    DestroyObject(OBJECT_SELF, 4.5);
}
