void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 200:
        {
            //* Unlock Sarcophagus
            SetLocked(OBJECT_SELF,0);
        }
        break;
    }
}
