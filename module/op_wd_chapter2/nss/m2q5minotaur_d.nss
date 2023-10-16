void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 500:
            ActionMoveToObject(GetWaypointByTag("WP_M2Q5MINOTAUR"));
        break;
    }
}
