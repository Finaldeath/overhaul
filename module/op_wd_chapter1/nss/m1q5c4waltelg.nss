void main()
{
    object oPlayer = GetPCSpeaker();
    SetLocalObject(OBJECT_SELF,"NW_L_FollowObject", oPlayer);
    ChangeFaction(OBJECT_SELF,oPlayer);
    SignalEvent(OBJECT_SELF,EventUserDefined(5));
}
