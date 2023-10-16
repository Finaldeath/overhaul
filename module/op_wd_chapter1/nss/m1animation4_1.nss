void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        int nAnimation = ANIMATION_LOOPING_LISTEN;
        int nRandom = Random(10);
        switch(nRandom)
        {
            case 0: nAnimation = ANIMATION_FIREFORGET_DRINK ; break;
            case 1: nAnimation = ANIMATION_FIREFORGET_GREETING ; break;
            case 2: nAnimation = ANIMATION_FIREFORGET_HEAD_TURN_LEFT ; break;
            case 3: nAnimation = ANIMATION_FIREFORGET_HEAD_TURN_RIGHT ; break;
            case 4: nAnimation = ANIMATION_FIREFORGET_PAUSE_BORED ; break;
            case 5: nAnimation = ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD ; break;
            case 6: nAnimation = ANIMATION_LOOPING_TALK_LAUGHING; break;
        }
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionPlayAnimation(nAnimation);
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing"))));
    }
}
