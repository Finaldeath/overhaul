void main()
{
    ActionStartConversation(OBJECT_SELF);
    DelayCommand(30.0,SignalEvent(OBJECT_SELF,EventUserDefined(0)));
}
