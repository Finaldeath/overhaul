// Start the final cutscene

void main()
{
    if(GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") == 5)
    {
        object oTrigger = GetObjectByTag("Q3B_TRIG_PORTAL_ROOM");
        SignalEvent(oTrigger, EventUserDefined(102));
    }
}
