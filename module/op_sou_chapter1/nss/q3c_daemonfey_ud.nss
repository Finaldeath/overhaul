// play specific immobile animations

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        int nRand = Random(4);
        if(nRand == 0)
            return;
        if(nRand == 1)
            ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
        else if(nRand == 2)
            ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
        else
            ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
    }
}
