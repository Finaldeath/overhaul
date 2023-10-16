void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE &&
       GetIsInCombat()== FALSE &&
       GetLocalInt(OBJECT_SELF,"NW_L_M1Q3ItemsReceived") == FALSE)
    {
        if(GetLocalInt(OBJECT_SELF,"NW_L_Skip") == FALSE)
        {
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
            SpeakOneLinerConversation("M1Q3ASoapbox");
            SetLocalInt(OBJECT_SELF,"NW_L_Skip",TRUE);
        }
        else
            SetLocalInt(OBJECT_SELF,"NW_L_Skip",FALSE);
    }

}
