void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 500:
            ActionCloseDoor(OBJECT_SELF);
            SetLocked(OBJECT_SELF,TRUE);
        break;
        case 501:
            SetLocked(OBJECT_SELF,FALSE);
        break;
    }
}
