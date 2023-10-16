// Pressure plate on-exit: decrease enter count and if needed - switch status to "up",
// and update the area using a user-defined event.

void main()
{
    SignalEvent(OBJECT_SELF, EventUserDefined(102));
}
