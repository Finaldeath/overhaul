void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1S4Talking") == FALSE)
    {
        int nAnimation;
        int nRandom = Random(11);
        switch(nRandom)
        {
            case 0: nAnimation = ANIMATION_FIREFORGET_DRINK ; break;
            case 1: nAnimation = ANIMATION_FIREFORGET_GREETING ; break;
            case 2: nAnimation = ANIMATION_FIREFORGET_HEAD_TURN_LEFT ; break;
            case 3: nAnimation = ANIMATION_FIREFORGET_HEAD_TURN_RIGHT ; break;
            case 4: nAnimation = ANIMATION_FIREFORGET_PAUSE_BORED ; break;
            case 5: nAnimation = ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD ; break;
            case 6: nAnimation = ANIMATION_LOOPING_PAUSE_DRUNK; break;
            case 7: nAnimation = ANIMATION_LOOPING_PAUSE_TIRED; break;
            case 8: nAnimation = ANIMATION_LOOPING_TALK_LAUGHING; break;
            case 9: nAnimation = ANIMATION_LOOPING_TALK_FORCEFUL; break;
            case 10: nAnimation = ANIMATION_LOOPING_TALK_PLEADING; break;
        }
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionPlayAnimation(nAnimation);
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
        ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing"))));
    }
}
