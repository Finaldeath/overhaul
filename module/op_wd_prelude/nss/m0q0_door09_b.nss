void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
        case 0:
        //Close and lock door to Graduation
        ActionCloseDoor(OBJECT_SELF);
        SetLocked(OBJECT_SELF,TRUE);
        break;
    }
}
