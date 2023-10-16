// init fire trap: select a delay and signal the start event

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oSource1 = GetNearestObjectByTag("Q2D_FIRE_SOURCE1");
    object oSource2 = GetNearestObjectByTag("Q2D_FIRE_SOURCE2");
    object oSource3 = GetNearestObjectByTag("Q2D_FIRE_SOURCE3");
    object oSource4 = GetNearestObjectByTag("Q2D_FIRE_SOURCE4");
    object oSource5 = GetNearestObjectByTag("Q2D_FIRE_SOURCE5");
    object oSource6 = GetNearestObjectByTag("Q2D_FIRE_SOURCE6");
    object oSource7 = GetNearestObjectByTag("Q2D_FIRE_SOURCE7");
    object oSource8 = GetNearestObjectByTag("Q2D_FIRE_SOURCE8");

    SetLocalFloat(oSource1, "Q2_FIRE_DELAY", 2.0);
    SetLocalFloat(oSource2, "Q2_FIRE_DELAY", 4.0);
    SetLocalFloat(oSource3, "Q2_FIRE_DELAY", 4.0);
    SetLocalFloat(oSource4, "Q2_FIRE_DELAY", 6.0);
    SetLocalFloat(oSource5, "Q2_FIRE_DELAY", 8.0);
    SetLocalFloat(oSource6, "Q2_FIRE_DELAY", 10.0);
    SetLocalFloat(oSource7, "Q2_FIRE_DELAY", 12.0);
    SetLocalFloat(oSource8, "Q2_FIRE_DELAY", 2.0);

    SignalEvent(oSource1, EventUserDefined(101));
    SignalEvent(oSource2, EventUserDefined(101));
    SignalEvent(oSource3, EventUserDefined(101));
    SignalEvent(oSource4, EventUserDefined(101));
    SignalEvent(oSource5, EventUserDefined(101));
    SignalEvent(oSource6, EventUserDefined(101));
    SignalEvent(oSource7, EventUserDefined(101));
    SignalEvent(oSource8, EventUserDefined(101));
}
