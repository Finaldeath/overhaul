void main()
{
    if(GetLocalInt(GetModule(),"NW_M0Q0_Enemies") == 0)
    {
        ClearAllActions();
//*        SignalEvent(OBJECT_SELF,EventUserDefined(10));
//*        DelayCommand(1.0,SpeakString("*signal*"));
        DelayCommand(1.0,ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(10))));
        DelayCommand(1.0,SetLocalInt(GetModule(),"NW_M0Q0_Enemies",1));
    }
}
