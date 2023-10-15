void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
    case 1006:
    {
        SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",2);
         // * generic surrender should only fire once
        if(GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") == 2)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,
            RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            while(GetIsObjectValid(oTarget))
            {
                if(oTarget != OBJECT_SELF)
                {
                    if(GetIsEnemy(oTarget))
                    {
                        AdjustReputation(oTarget, OBJECT_SELF, 50);
                        ClearPersonalReputation(oTarget);
                        SetIsTemporaryFriend(oTarget);
                        SpeakString(GetName(oTarget) +  " Adjusted to" +
                        IntToString(GetReputation(OBJECT_SELF, oTarget)));
                    }
                    AssignCommand(oTarget, ClearAllActions());
                    AssignCommand(oTarget,ActionAttack(OBJECT_INVALID));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,
                RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            }
            ClearAllActions();
            SpeakOneLinerConversation();
        }
        break;
    }
    }
}
