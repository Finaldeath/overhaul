// * Sets player to follow
void main()
{
    ActionMoveToObject(GetNearestObjectByTag("WP_G_M4Q1LEESA"));
    DelayCommand(2.0,ActionJumpToObject(GetObjectByTag("WP_M4MOON_LEESA")));
    SetLocalObject(GetModule(),"NW_G_M4Q01PLOTLEESA_SAVIOUR",GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE",1);
}
