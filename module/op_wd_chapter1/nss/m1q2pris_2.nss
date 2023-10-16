void main()
{
    if(GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen() && GetLocalInt(OBJECT_SELF,"NW_L_M1Q2Anger") < 1)
    {
        SetLocalObject(OBJECT_SELF,"NW_L_M1Q2BAlerter",GetLastPerceived());
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q2BAnger",1);
        ActionStartConversation(OBJECT_SELF);
        DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(280)));
    }
}
