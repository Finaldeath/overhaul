void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 111:
            ClearAllActions();
            ActionForceMoveToObject(GetObjectByTag("WP_M1Q1FDestroy"),TRUE);
            ActionDoCommand(DestroyObject(OBJECT_SELF));
        break;
    }
}
