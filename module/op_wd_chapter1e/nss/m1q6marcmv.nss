void main()
{
    ActionMoveToObject(GetWaypointByTag("WP_MarcusDestroy"),TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
