void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 110:

        ClearAllActions();
        ActionJumpToObject(GetWaypointByTag("WP_M1Q1FDestroy"));
        ActionForceMoveToObject(GetWaypointByTag("WP_M1Q1Atte"));
        break;
    }
}
