void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 1001:
        {
            if(IsInConversation(OBJECT_SELF) == FALSE &&
               GetIsObjectValid(GetAttemptedAttackTarget()) == FALSE)
               {
                    int nCount = GetLocalInt(OBJECT_SELF,"NW_L_Count");
                    if(nCount == 0)
                    {
                        ActionStartConversation(OBJECT_SELF);
                    }
                    if(nCount >=2)
                    {
                        nCount = 0;
                    }
                    else
                    {
                        nCount++;
                    }
                    SetLocalInt(OBJECT_SELF,"NW_L_Count",nCount);
               }
        }
        break;
        case 1003:
        {
            if(Random(3) == 0)
            {
                SpeakOneLinerConversation();
            }
        }
        break;
    }
}
