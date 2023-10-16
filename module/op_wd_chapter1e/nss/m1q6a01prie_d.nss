void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 601:
        {
            object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION,REPUTATION_TYPE_ENEMY);
            if(!GetIsObjectValid(oEnemy) || !GetObjectSeen(oEnemy))
            {
                ClearAllActions();
                ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP);
                DelayCommand(10.0,SignalEvent(OBJECT_SELF,EventUserDefined(601)));
            }
        }
        break;
    }
}
