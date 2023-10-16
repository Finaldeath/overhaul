void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oPC = GetLocalObject(OBJECT_SELF,"NW_L_M1Q2BAlerter");
    switch (nEvent)
    {
        case 280:
            if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q2BAnger") != 10)
            {
                SetLocalInt(OBJECT_SELF,"NW_L_M1Q2BAnger",2);
                ActionStartConversation(OBJECT_SELF);
                ActionMoveToObject(oPC,TRUE);
                DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(281)));
            }
        break;
        case 281:
            if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q2BAnger") != 10)
            {
                SetLocalInt(OBJECT_SELF,"NW_L_M1Q2BAnger",3);
                ActionStartConversation(OBJECT_SELF);
                ActionAttack(oPC);
                AdjustReputation(oPC,OBJECT_SELF,-100);
            }
        
    }
}
