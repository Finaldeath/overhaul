void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 440:
        if(GetLocalInt(OBJECT_SELF,"NW_L_Talking") == FALSE)
        {
            ActionWait(3.0f);
            ActionMoveToObject(GetNearestObjectByTag("WP_M1Q4F_M1Q4G"));
            ActionDoCommand(SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1Q4FGuards")));
            ActionDoCommand(DestroyObject(OBJECT_SELF));
        }
        break;
        case 441:
        if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q4ChefPasswordTold") == FALSE)
        {
            ActionStartConversation(OBJECT_SELF);
           //DelayCommand(12.0,SignalEvent(OBJECT_SELF,EventUserDefined(440)));
        }
        break;
    }
}
