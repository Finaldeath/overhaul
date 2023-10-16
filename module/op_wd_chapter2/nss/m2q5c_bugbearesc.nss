void main()
{
    object oExit = GetWaypointByTag("WP_BBearPrisEscape");

    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    ActionForceMoveToObject(oExit,TRUE,1.6,10.0);
    DestroyObject(OBJECT_SELF,10.0);
    SetCommandable(FALSE);
}
