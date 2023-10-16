// Pressure plate on-enter: increase enter count and if needed - switch status to "down",
// and update the area using a user-defined event.

void main()
{
    SetLocalObject(OBJECT_SELF, "ENTERING_OBJECT", GetEnteringObject());
    SignalEvent(OBJECT_SELF, EventUserDefined(101));
}
