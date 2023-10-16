void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 580:
            if(GetIsObjectValid(GetLastAttacker()) == FALSE)
            {
                ActionMoveToObject(GetNearestObjectByTag("WP_M1Q5E1_M1Q5F2"),TRUE);
                ActionDoCommand(DestroyObject(OBJECT_SELF));
                DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(580)));
            }

        break;
    }
}
