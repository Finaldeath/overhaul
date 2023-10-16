void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 505:
        {
            object oPlayer = GetLocalObject(OBJECT_SELF,"NW_L_FollowObject");
            if( GetIsObjectValid(oPlayer) &&
                !GetIsObjectValid(GetAttackTarget()) )
            {
                ClearAllActions();
                if(GetArea(OBJECT_SELF) == GetArea(oPlayer))
                    ActionMoveToObject(oPlayer,TRUE,3.0f);
                else
                    ActionJumpToObject(oPlayer);
                DelayCommand(6.0f,SignalEvent(OBJECT_SELF,EventUserDefined(505)));
            }
        }
        break;
        case 506:
        {
            object oDestination = GetWaypointByTag("WP_M1Q5C04WaltersDest");
            if(GetArea(oDestination) == GetArea(OBJECT_SELF) &&
               GetDistanceToObject(oDestination) > 5.0)
            {
                ClearAllActions();
                ActionMoveToObject(oDestination,TRUE,4.0f);
                DelayCommand(6.0f,SignalEvent(OBJECT_SELF,EventUserDefined(506)));
            }
        }
        break;
    }
}
