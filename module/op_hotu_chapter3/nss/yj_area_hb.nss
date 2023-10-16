// Devil's army area hb event

void main()
{
    ExecuteScript("hx_icep_areahb", OBJECT_SELF);
    SignalEvent(OBJECT_SELF, EventUserDefined(102));
}
