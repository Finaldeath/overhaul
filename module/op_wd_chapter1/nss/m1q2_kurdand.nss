void main()
{
    int iEventNumber = GetUserDefinedEventNumber();

    switch (iEventNumber)
    {
//OnDamage Event: Initiate surrender conversation if reduced to less than 15 HP
//                and I have not retracted my surrender.
        case 1006:
        {
            int iHP = GetCurrentHitPoints();
            int iConvState = GetLocalInt(OBJECT_SELF, "ConversationState");
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));

            if (iConvState < 4)
            {
                if (iHP < 15)
                {
                    while(GetIsObjectValid(oTarget))
                    {
                        if(oTarget != OBJECT_SELF)
                        {
                            if(GetIsEnemy(oTarget))
                            {
                                ClearPersonalReputation(oTarget);
                                SetIsTemporaryFriend(oTarget);
                            }
                            AssignCommand(oTarget, ClearAllActions());
                            AssignCommand(oTarget, ActionAttack(OBJECT_INVALID));
                        }
                        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
                    }

                    ClearAllActions();
                    SetLocalInt(OBJECT_SELF, "ConversationState", 2);
                    SpeakOneLinerConversation();
                }
            }
        }
        break;
    }
}
