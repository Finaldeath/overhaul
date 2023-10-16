void main()
{
    if(Random(6) == 0)
    {
        SpeakOneLinerConversation();
    }
   // ClearAllActions();
    if(Random(3) == 0)
    {
        ClearAllActions();
        ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0,6.0);
    }
    ActionRandomWalk();
}
