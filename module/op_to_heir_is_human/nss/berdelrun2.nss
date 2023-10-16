void main()
{
    object oWaypoint3 = GetObjectByTag("WP_BerdelRun");
    ActionMoveToObject(oWaypoint3,TRUE);
    DestroyObject(OBJECT_SELF,5.0);
}
