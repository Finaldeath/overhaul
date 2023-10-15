void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 200:
        {
            if(!IsInConversation(OBJECT_SELF))
            {
                ActionAttack(GetNearestObjectByTag("M1Q0BDummy01"));
                DelayCommand(12.0,ClearAllActions());
                DelayCommand(24.0,SignalEvent(OBJECT_SELF,EventUserDefined(200)));
            }
            else
            {
                DelayCommand(12.0,SignalEvent(OBJECT_SELF,EventUserDefined(200)));
            }
        }
    }
}
