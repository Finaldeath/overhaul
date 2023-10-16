void main()
{
    SetLocalObject(OBJECT_SELF,"NW_L_Master",GetPCSpeaker());
    SignalEvent(OBJECT_SELF,EventUserDefined(520));
}
