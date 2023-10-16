// the user defined event number 101 of the gong will activate the alarm system

void main()
{
    SignalEvent(OBJECT_SELF, EventUserDefined(101));
}
