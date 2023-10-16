void main()
{
    SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",30);
    DelayCommand(2.0,SignalEvent(OBJECT_SELF,EventUserDefined(300)));
}
