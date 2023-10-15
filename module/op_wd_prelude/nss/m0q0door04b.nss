void main()
{

int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
        case 1:
            {
                SetLocked(OBJECT_SELF,FALSE);
                ActionOpenDoor(OBJECT_SELF);
            }
            break;
    }
}
