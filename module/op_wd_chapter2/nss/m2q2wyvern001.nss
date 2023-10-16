void main()
{
    ActionForceMoveToObject(GetWaypointByTag("WP_WYVERN"),TRUE);
    DestroyObject(OBJECT_SELF,10.0);
    SetCommandable(FALSE);
}
