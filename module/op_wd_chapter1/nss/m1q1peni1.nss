void main()
{
    if(Random(3) == 0 && IsInConversation(OBJECT_SELF) == FALSE)
    {
        SpeakOneLinerConversation();
    }
    if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,1.0,4000.0);
    }
}
