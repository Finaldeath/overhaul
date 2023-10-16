void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 500:
            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0,5000.0);
        break;
    }
}
