///////////////////////////////////////////////////////////////////////////////
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 200:
        {
            ActionOpenDoor(OBJECT_SELF);
        }
        break;
        case 201:
        {
            ActionCloseDoor(OBJECT_SELF);
        }
        break;
    }

}
