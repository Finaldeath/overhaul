void main()
{
    if(GetIsInCombat() == FALSE &&
       GetIsObjectValid(GetNearestObjectByTag("m1Q04CCallik")))
    {
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL);
    }
}
