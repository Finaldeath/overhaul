
void main()
{
    object oExit = GetExitingObject();
    object oTrigger = GetLocalObject(OBJECT_SELF, "Q2B_ON_PLATE" + ObjectToString(oExit));
    // exiting object was on a trigger when the exit event was fired
    if(oTrigger != OBJECT_INVALID)
        SignalEvent(oTrigger, EventUserDefined(102)); // fire the exit event for the trigger
}
