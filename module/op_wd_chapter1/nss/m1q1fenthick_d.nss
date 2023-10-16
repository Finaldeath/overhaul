void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 100:
                ClearAllActions();
                SetLocalInt(OBJECT_SELF,"M1Q1BlockConv",TRUE);
                ActionMoveToObject(GetWaypointByTag("WP_M1Q1FDestroy"));
                ActionDoCommand(DestroyObject(OBJECT_SELF));
        break;
        case 101:
            if(GetLocalInt(GetModule(),"NW_G_M1Q1A1PlayerConversation") == FALSE &&
               GetLocalInt(OBJECT_SELF,"M1Q1FenthickTalking") == FALSE &&
               GetLocalInt(GetModule(),"NW_G_M1Q1ArgumentStart") == FALSE)
            {
                ActionStartConversation(OBJECT_SELF);
                DelayCommand(30.0,SignalEvent(OBJECT_SELF,EventUserDefined(101)));
            }
        break;
    }
}
