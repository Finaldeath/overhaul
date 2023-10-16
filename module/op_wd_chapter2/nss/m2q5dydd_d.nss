void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 500:
            DelayCommand(1000.0,SignalEvent(OBJECT_SELF,EventUserDefined(500)));
        break;
    }
}
