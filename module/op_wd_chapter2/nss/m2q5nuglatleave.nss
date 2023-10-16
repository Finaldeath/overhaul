void main()
{
    ActionForceMoveToObject(GetWaypointByTag("WP_NUGLAT_EXIT"),TRUE,1.0,10.0);
    DelayCommand(5.0,ClearAllActions());
    DelayCommand(10.0,DestroyObject(OBJECT_SELF));
}
