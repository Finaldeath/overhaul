void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
        case 100:
            {
                SetLocked(OBJECT_SELF,FALSE);
                ActionOpenDoor(OBJECT_SELF);
            }
        break;
    }
}
